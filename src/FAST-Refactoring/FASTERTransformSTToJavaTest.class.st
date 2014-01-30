Class {
	#name : #FASTERTransformSTToJavaTest,
	#superclass : #FASTERSearchTest,
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #tests }
FASTERTransformSTToJavaTest >> testIfTrueBlockJavaTransformation [
	| ifTrueCollection ifTrueJavaCollection |
	"FASTERDisplay display: (self methodNamed: #ifTrueMethod)."
	fastSearch scope: (self methodNamed: #ifTrueMethod).
	
	ifTrueCollection := fastSearch find: FASTPharoMessageSend where: [ :a | a selector name = #ifTrue:].
	ifTrueCollection --> #FASTERTransformIfBlockInJava.
	
	ifTrueJavaCollection := fastSearch find: FASTJavaIfStatement.
	self assert: ifTrueJavaCollection isCollection.
	self assert: ifTrueJavaCollection size equals: ifTrueCollection size.
	self assert: (fastSearch find: FASTPharoBlockDefinition) isEmpty.
	self assert: (fastSearch find: FASTPharoBlockExpression) isEmpty.
	"fastSearch findAll do: [ :fastEntity | self assert: fastEntity parentNode isNotNil ]."
	
	"FASTERDisplay display: (self methodNamed: #ifTrueMethod)."
]
