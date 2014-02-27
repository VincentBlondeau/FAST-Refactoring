"
A FASTERInTransformSTToJavaTest is xxxxxxxxx.

"
Class {
	#name : #FASTERInOutTransformSTToJavaTest,
	#superclass : #FASTERTransformTest,
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #tests }
FASTERInOutTransformSTToJavaTest >> fasterClass [
	^ FASTERInOutTransformIfBlockInJava 
]

{ #category : #tests }
FASTERInOutTransformSTToJavaTest >> testIfTrueBlockJavaInOutTransformation [
	| ifTrueJavaCollection |
	fasterInstance scope: (self methodNamed: #ifTrueMethod).
	ifTrueJavaCollection := fasterInstance run.
	self assert: ifTrueJavaCollection isCollection.
	self assert: ifTrueJavaCollection isNotEmpty
]
