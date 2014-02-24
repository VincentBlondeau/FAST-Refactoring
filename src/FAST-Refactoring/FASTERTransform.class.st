"
A FASTERTransform is an abstract method allowing transformations on FAST models.

For applying a transformation, send the message --> to the root element with the symbol of the transformation class as parameter.

To be recognize as a transformation, the method in the transformation class as to wear the pragma : <transform> and should say on which kind of MooseClass she can understand by the pragma : <on: #FASTExpression> for example.

To add or remove some objects from a collection, you can use the methods :
add: in: -> adds an Object in a  IV (use the selector associated to the IV)
remove: in: -> removes an Object

Instance Variables
	direction:		a symbol

direction
	- xxxxx

"
Class {
	#name : #FASTERTransform,
	#superclass : #FASTERSearch,
	#instVars : [
		'transformationClass',
		'direction',
		'inNode'
	],
	#category : #'FAST-Refactoring-Core'
}

{ #category : #'public - processing' }
FASTERTransform >> apply: aMethodSelector on: aNode [
	|  children res |
	self checkNodeTypeIsValid: aNode.
	^ (self canApply: aMethodSelector on: aNode)
		ifTrue: [ 
			self perform: aMethodSelector asMutator with: aNode ]
		ifFalse: [ |result| 
			children := aNode childrenNodes.
			result := OrderedCollection new.
			children ifNotEmpty: [ (children
						do: [ :each | 
							res := self apply: aMethodSelector on: each.
							res isCollection
								ifTrue: [ result addAll: res ] 
								ifFalse: [ result add: res ] ]) ].
			^ result	
					  ] 	"isCollection
				ifTrue: [ FASTERTransformationReturnInvalid signal ] ]"
]

{ #category : #private }
FASTERTransform >> canApply: aMethodSelector on: aNode [
	| pragma class whereMethodSelector |
	pragma := self getPragmaFromSelector: aMethodSelector asMutator.
	class := pragma argumentAt: 1.
	pragma numArgs > 1
		ifTrue: [ whereMethodSelector := (pragma argumentAt: 2) asMutator ].
	^ (aNode isKindOf: class asClass)
		and: [ whereMethodSelector ifNotNil: [ self perform: whereMethodSelector with: aNode ] ifNil: [ true ] ]
]

{ #category : #private }
FASTERTransform >> checkNodeTypeIsValid: aNode [
	aNode isCollection ifTrue: [ FASTERException signal ]
]

{ #category : #private }
FASTERTransform >> getPragmaFromSelector: aSelector [
	| method pragmas |
	[ method := self class methodNamed: aSelector ]
		on: KeyNotFound
		do: [ FASTERTransformationsNotProperlySet signal ].
	pragmas := {(Pragma inMethod: method named: #transformOn:).
					(Pragma inMethod: method named: #transformOn:where:)} 
						select: [ :p | p isNotNil ].
	pragmas size ~= 1
		ifTrue: [ FASTERTransformationsNotProperlySet signal ].
	^ pragmas first
]

{ #category : #private }
FASTERTransform >> methodsWithTransformOnPragma [
	^ (Pragma allNamed: #transformOn: in: self class) collect: [ :pragma | pragma  method ] 
]

{ #category : #private }
FASTERTransform >> methodsWithTransformOnWherePragma [
	^ (Pragma allNamed: #transformOn:Where: in: self class) collect: [ :pragma | pragma  method ] 
]

{ #category : #'as yet unclassified' }
FASTERTransform >> run [
	| transformationValue |
	transformationValue := self entryPoint.
	^ self result ifEmpty: [ transformationValue ]
]
