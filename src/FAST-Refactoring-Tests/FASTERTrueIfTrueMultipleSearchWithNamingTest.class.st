"
A FASTERTrueIfTrueMultipleSearchWithNamingTest is a filtering (search) test class with multiple filtering stacked. Each filtering result is named.

"
Class {
	#name : #FASTERTrueIfTrueMultipleSearchWithNamingTest,
	#superclass : #FASTERSearchTest,
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #accessing }
FASTERTrueIfTrueMultipleSearchWithNamingTest >> fasterClass [
	^ FASTERMultipleSearchWithNaming
]

{ #category : #tests }
FASTERTrueIfTrueMultipleSearchWithNamingTest >> testTrueIfTrueBlockSearchInTrueIfTrueNestedAndParallelMethod [
	| result |
	result := fasterInstance
		scope: (self methodNamed: #trueIfTrueNestedAndParallelMethod);
		run.
	self assert: result isDictionary.
	self assert: (result at: #FBE) size equals: 3.
	self assert: (result at: #FPMS) size equals: 4.
	self assert: ((result at: #FPMS) inject: true into: [ :bool :each | bool and: [ each selector name = #ifTrue: ] ]).
	self assert: (result at: #FPS) size equals: 4
]
