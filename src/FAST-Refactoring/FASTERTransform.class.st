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
		'direction'
	],
	#category : #'FAST-Refactoring-Core'
}

{ #category : #private }
FASTERTransform >> apply [
	| transformations transformationMethod |
	transformations := self methodsWithValidTransformation.
	self checkApplicability: transformations.
	transformationMethod := transformations first method .
	self changeTheThisIV: transformationMethod.
	^ self perform: transformationMethod selector
]

{ #category : #private }
FASTERTransform >> changeTheThisIV: transformationMethod [
	(transformationMethod hasPragmaNamed: #in) ifTrue: [ "self this: self this deepCopy" ]
	"the deepCopy copy all the mooseModel -> not a good idea...."
	
]

{ #category : #private }
FASTERTransform >> checkApplicability: transformations [
	transformations size > 1
		ifTrue: [ FASTERSeveralTransformationsAppliables signalTransformationClass: self class fastClass: this class ].
	transformations
		ifEmpty: [ FASTERTransformationDoesntExists signalTransformationClass: self class fastClass: this class ]
]

{ #category : #accessing }
FASTERTransform >> checkIsValidDirection: aSymbol [
	| directionList |
	directionList := #(in inout).
	(directionList includes: aSymbol) ifFalse: [ FASTERTransformationDirectionNotProperlySet signal ].
]

{ #category : #'private - accessing' }
FASTERTransform >> direction [
	^ direction
]

{ #category : #'private - accessing' }
FASTERTransform >> direction: aSymbol [
	self checkIsValidDirection: aSymbol.
	direction := aSymbol
]

{ #category : #private }
FASTERTransform >> methodsWithTransformOnTag [
	^ (Pragma allNamed: #transformOn: in: self class) collect: [ :pragma | pragma  method ] 
]

{ #category : #private }
FASTERTransform >> methodsWithValidTransformation [
	^ self methodsWithTransformOnTag select: [ :aCompiledMethod | self this isApplicableTransformation: aCompiledMethod ].
]

{ #category : #'public - processing' }
FASTERTransform >> run [
	^ super run --> self class
]

{ #category : #accessing }
FASTERTransform >> transformationClass [
	^ transformationClass
]

{ #category : #accessing }
FASTERTransform >> transformationClass: aClass [
	transformationClass := aClass 
]
