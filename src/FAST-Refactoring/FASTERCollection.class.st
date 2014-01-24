Class {
	#name : #FASTERCollection,
	#superclass : #OrderedCollection,
	#instVars : [
		'transformationClass'
	],
	#category : #'FAST-Refactoring-Core'
}

{ #category : #'as yet unclassified' }
FASTERCollection >> --> aTransformationMethodName [
	self do: [ :each | | transform |
		transform := transformationClass new this: each; yourself.
		transform perform: aTransformationMethodName 
	]
	
]

{ #category : #'as yet unclassified' }
FASTERCollection >> asFASTERCollection [
	^ self
]
