"
A FASTERTransform is an abstract method allowing transformations on FAST models.

To create you own transformations set, you need to subclass implement the entryPoint are your own rules described below :

==== Transformation calling ====

For applying a transformation, the only way is to send the message apply:on:  with arguments:
- the name of the rule to apply in the self class.
- the root element of the model on which the transformation will be executed.

For now this message has to be called in the entryPoint method (see superclass comment) with the first transformation name and the result of the search done in the entryPoint to amorce the transformation. (Should be improved !)

The transform engine traverses all the submodel (from the root to the children) until a transformation with the name specified can be applied.

==== Definition of transformation rules ====

The transformation name as to be the same as called by apply:on: but mutated (i.e. : self apply: #aTransformationName on: aNode. the transformation must be called aTransformationName:) to take a model node in parameter.

This node is characterised by the pragma defined in the transformation rule.

To be recognize as a transformation, the method in the transformation class as to wear the pragma 
<transformOn: MooseEntity> or <transformOn: MooseEntity where: #aBooleanSelectorOnANode>,
else an FASTERTransformationDoesntExists exception will be risen.



The transformation rule will be executed only on the node of the class or a subclass of MooseEntity.

The MooseEntity must be remplaced by one of its subclasses. 




on which kind of MooseClass she can understand by the pragma : <on: #FASTExpression> for example.

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
	#category : #'FAST-Refactoring-Core'
}

{ #category : #'public - processing' }
FASTERTransform >> apply: aMethodSelector on: aNode [
	| children res |
	self checkNodeTypeIsValid: aNode.
	^ (self canApply: aMethodSelector on: aNode)
		ifTrue: [ self perform: aMethodSelector asMutator with: aNode ]
		ifFalse: [ 
			| return |
			children := aNode childrenNodes.
			return := OrderedCollection new.
			children
				ifNotEmpty: [ 
					children
						do: [ :each | 
							res := self apply: aMethodSelector on: each.
							res isCollection
								ifTrue: [ return addAll: res ]
								ifFalse: [ return add: res ] ] ].
			^ return ]
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
		do: [ FASTERTransformationDoesntExists signal ].
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

{ #category : #'public - processing' }
FASTERTransform >> run [
	| transformationValue |
	transformationValue := self entryPoint.
	^ self result ifEmpty: [ transformationValue ]
]
