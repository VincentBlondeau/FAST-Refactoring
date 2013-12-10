"
A RBInlineTemporaryRefactoring is xxxxxxxxx.

Instance Variables
	assignmentNode:		<Object>
	definingNode:		<Object>
	selector:		<Object>
	sourceInterval:		<Object>
	sourceTree:		<Object>

assignmentNode
	- xxxxx

definingNode
	- xxxxx

selector
	- xxxxx

sourceInterval
	- xxxxx

sourceTree
	- xxxxx

"
Class {
	#name : #FASTRBInlineTemporaryRefactoring,
	#superclass : #FASTRBMethodRefactoring,
	#instVars : [
		'sourceInterval',
		'selector',
		'sourceTree',
		'assignmentNode',
		'definingNode'
	],
	#category : #'FAST-Refactoring-Core-Refactorings'
}

{ #category : #'instance creation' }
FASTRBInlineTemporaryRefactoring class >> inline: anInterval from: aSelector in: aClass [ 
	^self new 
		inline: anInterval
		from: aSelector
		in: aClass
]

{ #category : #'instance creation' }
FASTRBInlineTemporaryRefactoring class >> model: aRBSmalltalk inline: anInterval from: aSelector in: aClass [ 
	^(self new)
		model: aRBSmalltalk;
		inline: anInterval
			from: aSelector
			in: aClass;
		yourself
]

{ #category : #'*FAST-Refactoring' }
FASTRBInlineTemporaryRefactoring class >> node: aNode from: aSelector in: aClass [ 
	^self new 
		node: aNode
		from: aSelector
		in: aClass
]

{ #category : #transforming }
FASTRBInlineTemporaryRefactoring >> compileMethod [
	class compileTree: sourceTree
]

{ #category : #testing }
FASTRBInlineTemporaryRefactoring >> hasOnlyOneAssignment [
	| searcher |
	searcher := RBParseTreeSearcher new.
	searcher matches: assignmentNode variable name , ' := ``@object'
		do: [:aNode :answer | answer + 1].
	^(searcher executeTree: definingNode initialAnswer: 0) == 1
]

{ #category : #'initialize-release' }
FASTRBInlineTemporaryRefactoring >> inline: anInterval from: aSelector in: aClass [ 
	class := self classObjectFor: aClass.
	selector := aSelector.
	sourceInterval := anInterval
]

{ #category : #'*FAST-Refactoring' }
FASTRBInlineTemporaryRefactoring >> node: anInterval from: aSelector in: aClass [ 
	class := self classObjectFor: aClass.
	selector := aSelector.
	assignmentNode := anInterval
]

{ #category : #preconditions }
FASTRBInlineTemporaryRefactoring >> preconditions [
	^(RBCondition definesSelector: selector in: class) 
		& (RBCondition withBlock: 
					[self verifySelectedInterval.
					true])
]

{ #category : #transforming }
FASTRBInlineTemporaryRefactoring >> replaceAssignment [
	assignmentNode parent isSequence 
		ifTrue: [assignmentNode parent removeNode: assignmentNode]
		ifFalse: [assignmentNode replaceWith: assignmentNode value]
]

{ #category : #transforming }
FASTRBInlineTemporaryRefactoring >> replaceReferences [
	| rewriter |
	rewriter := RBParseTreeRewriter new.
	rewriter replaceTree: assignmentNode variable
		withTree: assignmentNode value.
	definingNode removeTemporaryNamed: assignmentNode variable name.
	rewriter executeTree: definingNode
]

{ #category : #printing }
FASTRBInlineTemporaryRefactoring >> storeOn: aStream [ 
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream nextPutAll: ' inline: '.
	sourceInterval storeOn: aStream.
	aStream
		nextPutAll: ' from: #';
		nextPutAll: selector;
		nextPutAll: ' in: '.
	class storeOn: aStream.
	aStream nextPut: $)
]

{ #category : #transforming }
FASTRBInlineTemporaryRefactoring >> transform [
	self
		replaceAssignment;
		replaceReferences;
		compileMethod
]

{ #category : #preconditions }
FASTRBInlineTemporaryRefactoring >> verifySelectedInterval [
	sourceTree := class parseTreeFor: selector.
	sourceTree isNil ifTrue: [self refactoringFailure: 'Could not parse source'].
	assignmentNode := sourceTree whichNodeIsContainedBy: sourceInterval.
	assignmentNode isAssignment 
		ifFalse: 
			[self refactoringFailure: 'The selected node is not an assignment statement'].
	definingNode := assignmentNode whoDefines: assignmentNode variable name.
	self hasOnlyOneAssignment 
		ifFalse: 
			[self refactoringError: 'There are multiple assignments to the variable'].
	(RBReadBeforeWrittenTester isVariable: assignmentNode variable name
		writtenBeforeReadIn: definingNode) 
			ifFalse: 
				[self 
					refactoringError: 'The variable is possible read before it is assigned']
]
