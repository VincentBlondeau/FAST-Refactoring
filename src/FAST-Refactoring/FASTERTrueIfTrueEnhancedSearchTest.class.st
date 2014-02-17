Class {
	#name : #FASTERTrueIfTrueEnhancedSearchTest,
	#superclass : #FASTERSearchTest,
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #'as yet unclassified' }
FASTERTrueIfTrueEnhancedSearchTest >> fasterClass [
	^ FASTERTrueIfTrueEnhancedSearch
]

{ #category : #'as yet unclassified' }
FASTERTrueIfTrueEnhancedSearchTest >> testTrueIfTrueBlockEnhancedSearchInTrueIfTrueNestedAndParallelMethod [
	| result |
	result := fasterInstance
		scope: (self methodNamed: #trueIfTrueNestedAndParallelMethod);
		run.
	self assert: result isDictionary.
	self assert: (result at: 1) size equals: 4.
	self assert: ((result at: 1) inject: true into: [ :bool :each | bool and: [ each selector name = #ifTrue: ] ])
]
