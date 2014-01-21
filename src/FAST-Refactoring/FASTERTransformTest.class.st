Class {
	#name : #FASTERTransformTest,
	#superclass : #FASTERSearchTest,
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #tests }
FASTERTransformTest >> testIfTrueBlockJavaTransformation [
	| ifTrueCollection |
	ifTrueCollection := fastSearch find: FASTPharoMessageSend where: [ :a | a selector name = #ifTrue:].
	ifTrueCollection --> #transformIfTrueBlock.
	self assert: ifTrueCollection isCollection.
	self assert: ifTrueCollection isNotEmpty.
	self assert: (ifTrueCollection inject: true into: [ :bool :each | bool and: each selector name = #ifTrue: ]).
]

{ #category : #tests }
FASTERTransformTest >> testTrueIfTrueBlockInlineTransformation [
	| ifTrueCollection |
	ifTrueCollection := fastSearch find: FASTPharoMessageSend where: [ :a | a selector name = #ifTrue:].
	ifTrueCollection --> #transformIfTrueBlock.
	self assert: ifTrueCollection isCollection.
	self assert: ifTrueCollection isNotEmpty.
	self assert: (ifTrueCollection inject: true into: [ :bool :each | bool and: each selector name = #ifTrue: ]).
]
