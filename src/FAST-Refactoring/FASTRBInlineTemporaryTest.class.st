"
A RBInlineTemporaryTest is xxxxxxxxx.

"
Class {
	#name : #FASTRBInlineTemporaryTest,
	#superclass : #FASTRBRefactoringTest,
	#instVars : [
		'inlineMethod'
	],
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #tests }
FASTRBInlineTemporaryTest >> testInlineTemporary [
	| aNode refactoring |
	self assert: (inlineMethod statementBlock statements first expression isNotNil).
	aNode = inlineMethod statementBlock statements first expression.
	refactoring := RBInlineTemporaryRefactoring 
		node: aNode
		from: #inlineMethod
		in: RBRefactoryTestDataApp.
	self executeRefactoring: refactoring.
	self assert: ((refactoring model classNamed: #RBRefactoryTestDataApp) parseTreeFor: #inlineMethod) = (RBParser parseMethod: 'inlineMethod
										^self
													foo;
													inlineMethod;
													bar')
]

{ #category : #tests }
FASTRBInlineTemporaryTest >> testInlineTemporaryBadInterval [
	self shouldFail: (RBInlineTemporaryRefactoring 
			inline: (self 
					convertInterval: (29 to: 100)
					for: (RBRefactoryTestDataApp sourceCodeAt: #moveDefinition))
			from: #moveDefinition
			in: RBRefactoryTestDataApp)
]

{ #category : #tests }
FASTRBInlineTemporaryTest >> testInlineTemporaryMutlipleAssignment [
	self shouldFail: (RBInlineTemporaryRefactoring 
			inline: (self 
					convertInterval: (60 to: 83)
					for: (RBRefactoryTestDataApp sourceCodeAt: #moveDefinition))
			from: #moveDefinition
			in: RBRefactoryTestDataApp)
]

{ #category : #tests }
FASTRBInlineTemporaryTest >> testInlineTemporaryReadBeforeWritten [
	self shouldFail: (RBInlineTemporaryRefactoring 
			inline: (self 
					convertInterval: (48 to: 56)
					for: (RBRefactoryTestDataApp sourceCodeAt: #inlineTemporary))
			from: #inlineTemporary
			in: RBRefactoryTestDataApp)
]
