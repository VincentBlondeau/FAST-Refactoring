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
		'method',
		'sourceTree',
		'assignmentNode',
		'definingNode'
	],
	#category : #'FAST-Refactoring-Core-Refactorings'
}

{ #category : #'instance creation' }
FASTRBInlineTemporaryRefactoring class >> model: aRBSmalltalk inline: anInterval from: aSelector in: aClass [ 
	^(self new)
		model: aRBSmalltalk;
		inline: anInterval
			from: aSelector
			in: aClass;
		yourself
]

{ #category : #'instance creation' }
FASTRBInlineTemporaryRefactoring class >> node: aASTNode from: aSelector in: aClass [ 
	^self new 
		node: aASTNode
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
	searcher := FASTRBParseTreeSearcher new.
	searcher matches: assignmentNode variable name , ' := ``@object'
		do: [:aNode :answer | answer + 1].
	^(searcher executeTree: definingNode initialAnswer: 0) == 1
]

{ #category : #'initialize-release' }
FASTRBInlineTemporaryRefactoring >> node: anASTNode from: aMethodAST in: aFAMIXClass [ 
	class := aFAMIXClass.
	method := aMethodAST."ie FASTNamedBehaviouralEntity"
	assignmentNode := anASTNode
]

{ #category : #preconditions }
FASTRBInlineTemporaryRefactoring >> preconditions [
	^(FASTRBCondition definesMethod: method in: class) 
		& (FASTRBCondition withBlock: 
					[self verifySelectedNode.
					true])
]

{ #category : #transforming }
FASTRBInlineTemporaryRefactoring >> replaceAssignment [
	assignmentNode parentNode isSequence 
		ifTrue: [assignmentNode parentNode removeNode: assignmentNode]
		ifFalse: [assignmentNode replaceWith: assignmentNode value]
]

{ #category : #transforming }
FASTRBInlineTemporaryRefactoring >> replaceReferences [
	| rewriter |
	rewriter := FASTRBParseTreeRewriter new.
	rewriter replaceTree: assignmentNode variable
		withTree: assignmentNode value.
	method removeTemporaryNamed: assignmentNode variable name.
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
FASTRBInlineTemporaryRefactoring >> verifySelectedNode [
	self flag: 'Simplified ... No verifications !'.
	sourceTree := method.
	sourceTree isNil ifTrue: [self refactoringFailure: 'Could not parse source'].
	"definingNode := assignmentNode whoDefines: assignmentNode variable name."
	definingNode := method.
	"self hasOnlyOneAssignment 
		ifFalse: 
			[self refactoringError: 'There are multiple assignments to the variable'].
	(RBReadBeforeWrittenTester isVariable: assignmentNode variable name
		writtenBeforeReadIn: definingNode) 
			ifFalse: 
				[self 
					refactoringError: 'The variable is possible read before it is assigned']"
]
