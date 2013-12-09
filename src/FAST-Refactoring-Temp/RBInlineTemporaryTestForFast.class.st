Class {
	#name : #RBInlineTemporaryTestForFast,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'inlineMethod'
	],
	#category : #'FAST-Refactoring-Temp'
}

{ #category : #tests }
RBInlineTemporaryTestForFast >> executeRefactoring: aRefactoring [ 
	aRefactoring primitiveExecute.
	RBParser parseExpression: aRefactoring storeString
]

{ #category : #tests }
RBInlineTemporaryTestForFast >> getFastMethodFromModelByName: methodName [
	^ (model allMethods detect: [ :method | method name = methodName ]) generateFAST; fastNamedBehaviouralEntity
]

{ #category : #tests }
RBInlineTemporaryTestForFast >> setUp [
	super setUp.
	model := MooseModel new.
	MoosePharoImporterTask new
	importerClass: SmalltalkImporter;
	model: model;
	addClasses: (OrderedCollection with: MockFAST);
	run.
	
	self setUpMethods.
]

{ #category : #tests }
RBInlineTemporaryTestForFast >> setUpMethods [
	inlineMethod := self getFastMethodFromModelByName:'inlineMethod'
]

{ #category : #tests }
RBInlineTemporaryTestForFast >> testInlineTemporary [
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
RBInlineTemporaryTestForFast >> testInlineTemporaryBadInterval [
	self shouldFail: (RBInlineTemporaryRefactoring 
			inline: (self 
					convertInterval: (29 to: 100)
					for: (RBRefactoryTestDataApp sourceCodeAt: #moveDefinition))
			from: #moveDefinition
			in: RBRefactoryTestDataApp)
]

{ #category : #tests }
RBInlineTemporaryTestForFast >> testInlineTemporaryMutlipleAssignment [
	self shouldFail: (RBInlineTemporaryRefactoring 
			inline: (self 
					convertInterval: (60 to: 83)
					for: (RBRefactoryTestDataApp sourceCodeAt: #moveDefinition))
			from: #moveDefinition
			in: RBRefactoryTestDataApp)
]

{ #category : #tests }
RBInlineTemporaryTestForFast >> testInlineTemporaryReadBeforeWritten [
	self shouldFail: (RBInlineTemporaryRefactoring 
			inline: (self 
					convertInterval: (48 to: 56)
					for: (RBRefactoryTestDataApp sourceCodeAt: #inlineTemporary))
			from: #inlineTemporary
			in: RBRefactoryTestDataApp)
]
