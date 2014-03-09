"
A FASTERTrueIfTrueMultipleSearchWithoutNamingTest is a filtering (search) test class with multiple filtering stacked. None filtering result is named.
"
Class {
	#name : #FASTERTrueIfTrueMultipleSearchWithoutNamingTest,
	#superclass : #FASTERSearchTest,
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #accessing }
FASTERTrueIfTrueMultipleSearchWithoutNamingTest >> fasterClass [
	^ FASTERMultipleSearchWithoutNaming
]

{ #category : #tests }
FASTERTrueIfTrueMultipleSearchWithoutNamingTest >> testTrueIfTrueBlockSearchInTrueIfTrueNestedAndParallelMethod [
	| result |
	result := fasterInstance
		scope: (self methodNamed: #trueIfTrueNestedAndParallelMethod);
		run.
	self assert: result isDictionary.
	self assert: (result at: 0) size equals: 3.
	self assert: (result at: 1) size equals: 4.
	self assert: ((result at: 1) inject: true into: [ :bool :each | bool and: [ each selector name = #ifTrue: ] ]).
	self assert: (result at: 2) size equals: 4
]
