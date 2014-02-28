"
A FASTERTrueIfTrueEnhancedSearchTest is xxxxxxxxx.

"
Class {
	#name : #FASTERTrueIfTrueEnhancedSearchMultipleWithNamingTest,
	#superclass : #FASTERSearchTest,
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #accessing }
FASTERTrueIfTrueEnhancedSearchMultipleWithNamingTest >> fasterClass [
	^ FASTERMultipleSearchWithNaming
]

{ #category : #tests }
FASTERTrueIfTrueEnhancedSearchMultipleWithNamingTest >> testTrueIfTrueBlockEnhancedSearchInTrueIfTrueNestedAndParallelMethod [
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
