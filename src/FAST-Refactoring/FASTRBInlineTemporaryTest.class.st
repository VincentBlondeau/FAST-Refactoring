"
A RBInlineTemporaryTest is xxxxxxxxx.

"
Class {
	#name : #FASTRBInlineTemporaryTest,
	#superclass : #FASTRBRefactoringTest,
	#category : #'FAST-Refactoring-RBTests-Core'
}

{ #category : #tests }
FASTRBInlineTemporaryTest >> testInlineTemporary [
	| aNode refactoring |
	aNode := inlineMethod statementBlock statements first expression.
	refactoring := FASTRBInlineTemporaryRefactoring 
		node: aNode
		from: inlineMethod
		in: (model entities detect: [ :e | e name = #FASTRBRefactoryTestDataApp ]).
	self executeRefactoring: refactoring.

	self assert: false.
	"self assert: ((refactoring model classNamed: #FASTRBRefactoryTestDataApp) parseTreeFor: #inlineMethod) = (RBParser parseMethod: 'inlineMethod
										^self
													foo;
													inlineMethod;
													bar')"
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
