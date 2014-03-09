"
A FASTERInTransformSTToJavaTest is a test class for an smalltalk  ifTrue: block transformation  to a Java if(...) one.

The transformation do a new FAST model
"
Class {
	#name : #FASTERInTransformSTToJavaTest,
	#superclass : #FASTERTransformTest,
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #tests }
FASTERInTransformSTToJavaTest >> fasterClass [
	^ FASTERInTransformIfBlockInJava 
]

{ #category : #tests }
FASTERInTransformSTToJavaTest >> testIfTrueBlockJavaInTransformation [
	| ifStatementBlock |
	fasterInstance scope: (self methodNamed: #ifTrueMethod).
	
	ifStatementBlock := fasterInstance run.
	self assert: ifStatementBlock isCollection not.
	self assert: (ifStatementBlock isKindOf: FASTJavaIfStatement)
]
