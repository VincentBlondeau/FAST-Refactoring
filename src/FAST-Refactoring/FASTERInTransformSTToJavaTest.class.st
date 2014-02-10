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
	search scope: (self methodNamed: #ifTrueMethod).
	ifStatementBlock := search run.
	self assert: ifStatementBlock size equals: 1
]
