Class {
	#name : #FASTERSearchTest,
	#superclass : #FASTERTest,
	#instVars : [
		'fastSearch'
	],
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #running }
FASTERSearchTest >> setUp [
	super setUp.
	fastSearch := FASTERSearch new 
		model: self model; 
		"transformationClass: #FASTERInOutTransformIfBlockInJava;"
		yourself.
]

{ #category : #tests }
FASTERSearchTest >> testIfTrueBlockSearch [
	| result |
	result := fastSearch find: FASTPharoMessageSend where: [ :a | a selector name = #ifTrue:].
	self assert: result isCollection.
	self assert: result isNotEmpty.
	self assert: (result inject: true into: [ :bool :each | bool and: each selector name = #ifTrue: ])
]

{ #category : #tests }
FASTERSearchTest >> testTrueIfTrueBlockSearch [
	| result |
	result := fastSearch find: FASTPharoMessageSend where: [ :a | a selector name = #ifTrue: and: [ (a concreteReceiver is: FASTBooleanLiteral) and: [ a concreteReceiver value = true]]].
	self assert: result isCollection.
	self assert: (result inject: true into: [ :bool :each | bool and: each selector name = #ifTrue: ])
]
