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
	self assert: ifStatementBlock size equals: 1
]
