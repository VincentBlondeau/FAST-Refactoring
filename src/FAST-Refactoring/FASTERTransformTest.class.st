Class {
	#name : #FASTERTransformTest,
	#superclass : #FASTERSearchTest,
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #tests }
FASTERTransformTest >> testIfTrueBlockJavaTransformation [
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

{ #category : #tests }
FASTERTransformTest >> testTrueIfTrueBlockInlineTransformation [
	| ifTrueCollection |
	ifTrueCollection := fastSearch find: FASTPharoMessageSend where: [ :a | a selector name = #ifTrue:].
	ifTrueCollection --> #transformIfTrueTrueBlock.
	self assert: ifTrueCollection isCollection.
	self assert: ifTrueCollection isNotEmpty.
	self assert: (ifTrueCollection inject: true into: [ :bool :each | bool and: each selector name = #ifTrue: ]).
]

{ #category : #tests }
FASTERTransformTest >> testTrueIfTrueBlockRemovalTransformation [
	| searchBlock |
	"FASTERDisplay display: (self methodNamed: #trueIfTrueMethod)."
	fastSearch scope: (self methodNamed: #trueIfTrueMethod).
	searchBlock := [ fastSearch find: FASTPharoMessageSend where: 
			[ :a | a selector name = #ifTrue: and: [ a concreteReceiver value = 'true']]].
	
	self assert: searchBlock value isNotEmpty.
	
	searchBlock value --> #FASTERTransformTrueIfTrueBlock.
	
	self assert: searchBlock value isEmpty.
	self assert: (fastSearch find: FASTPharoBlockDefinition) isEmpty.
	self assert: (fastSearch find: FASTPharoBlockExpression) isEmpty.
	"fastSearch findAll do: [ :fastEntity | self assert: fastEntity parentNode isNotNil ]."
	
	"FASTERDisplay display: (self methodNamed: #trueIfTrueMethod)."

]

{ #category : #tests }
FASTERTransformTest >> testTrueIfTrueNestedBlockRemovalTransformation [
	| searchBlock |
	"FASTERDisplay display: (self methodNamed: #trueIfTrueNestedMethod)."
	fastSearch scope: (self methodNamed: #trueIfTrueNestedMethod).
	searchBlock := [ fastSearch find: FASTPharoMessageSend where: 
			[ :a | a selector name = #ifTrue: and: [ a concreteReceiver value = 'true']]].
	
	self assert: searchBlock value isNotEmpty.
	
	searchBlock value --> #FASTERTransformTrueIfTrueBlock.
	
	self assert: searchBlock value isEmpty.
	self assert: (fastSearch find: FASTPharoBlockDefinition) isEmpty.
	self assert: (fastSearch find: FASTPharoBlockExpression) isEmpty.
	"fastSearch findAll do: [ :fastEntity | self assert: fastEntity parentNode isNotNil ]."
	"self fail."
	"should not working ...."
	FASTERDisplay display: (self methodNamed: #trueIfTrueNestedMethod).

]
