Class {
	#name : #FASTERTrueIfTrueEnhancedSearchTest,
	#superclass : #FASTERSearchTest,
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #accessing }
FASTERTrueIfTrueEnhancedSearchTest >> fasterClass [
	^ FASTERTrueIfTrueEnhancedSearch
]

{ #category : #tests }
FASTERTrueIfTrueEnhancedSearchTest >> testTrueIfTrueBlockEnhancedSearchInTrueIfTrueNestedAndParallelMethod [
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
