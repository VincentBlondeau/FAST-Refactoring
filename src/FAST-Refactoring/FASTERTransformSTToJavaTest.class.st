Class {
	#name : #FASTERTransformSTToJavaTest,
	#superclass : #FASTERSearchTest,
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #tests }
FASTERTransformSTToJavaTest >> testIfTrueBlockJavaInOutTransformation [
	| ifTrueCollection ifTrueJavaCollection |
	FASTERDisplay display: (self methodNamed: #ifTrueMethod).
	fastSearch scope: (self methodNamed: #ifTrueMethod).
	
	ifTrueCollection := fastSearch find: FASTPharoMessageSend where: [ :node | node selector name = #ifTrue:].
	ifTrueCollection --> #FASTERInOutTransformIfBlockInJava.
	
	ifTrueJavaCollection := fastSearch find: FASTJavaIfStatement.
	self assert: ifTrueJavaCollection isCollection.
	self assert: ifTrueJavaCollection size equals: ifTrueCollection size.
	self assert: (fastSearch find: FASTPharoBlockDefinition) isEmpty.
	self assert: (fastSearch find: FASTPharoBlockExpression) isEmpty.
	"fastSearch findAll do: [ :fastEntity | self assert: fastEntity parentNode isNotNil ]."
	
	FASTERDisplay display: (self methodNamed: #ifTrueMethod).
]

{ #category : #tests }
FASTERTransformSTToJavaTest >> testIfTrueBlockJavaInTransformation [
	| ifTrueCollection  ifStatementBlock |
	"FASTERDisplay display: (self methodNamed: #ifTrueMethod)."
	fastSearch scope: (self methodNamed: #ifTrueMethod).
	
	ifTrueCollection := fastSearch find: FASTPharoMessageSend where: [ :a | a selector name = #ifTrue:].
	self assert: ifTrueCollection size equals: 1.
	ifStatementBlock := ifTrueCollection --> #FASTERInTransformIfBlockInJava.

	self assert: ifStatementBlock size equals: 1.
	fastSearch scope: ifStatementBlock first.
	"fastSearch findAll do: [ :fastEntity | self assert: fastEntity parentNode isNotNil ]."
	
	"FASTERDisplay display: ifStatementBlock first."
]
