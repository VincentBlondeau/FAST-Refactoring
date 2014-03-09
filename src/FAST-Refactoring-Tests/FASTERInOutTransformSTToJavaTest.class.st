"
A FASTERInOutTransformSTToJavaTest is a test class for an smalltalk  ifTrue: block transformation  to a Java if(...) one.

The transformation is done on the in FAST model

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
	| ifTrueJava |
	fasterInstance scope: (self methodNamed: #ifTrueMethod).
	ifTrueJava := fasterInstance run.
	self assert: ifTrueJava isCollection not.
	self assert: (ifTrueJava isKindOf: FASTJavaIfStatement)
	
]
