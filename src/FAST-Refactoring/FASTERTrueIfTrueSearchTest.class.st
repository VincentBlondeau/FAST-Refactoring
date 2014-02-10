Class {
	#name : #FASTERTrueIfTrueSearchTest,
	#superclass : #FASTERSearchTest,
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #accessing }
FASTERTrueIfTrueSearchTest >> fasterClass [
	^ FASTERTrueIfTrueSearch
]

{ #category : #tests }
FASTERTrueIfTrueSearchTest >> testTrueIfTrueBlockSearch [
	| result |
	result := search run.
	self assert: result isCollection.
	self assert: result isNotEmpty.
	self assert: (result inject: true into: [ :bool :each | bool and: [each selector name = #ifTrue: ] ])
]

{ #category : #tests }
FASTERTrueIfTrueSearchTest >> testTrueIfTrueBlockSearchInTrueIfTrueMethod [
	| result |
	result := search scope: (self methodNamed: #trueIfTrueMethod); run.
	self assert: result isCollection.
	self assert: result size equals: 1.
	self assert: (result inject: true into: [ :bool :each | bool and: [each selector name = #ifTrue: ] ])
]

{ #category : #tests }
FASTERTrueIfTrueSearchTest >> testTrueIfTrueBlockSearchInTrueIfTrueNestedAndParallelMethod [
	| result |
	result := search
		scope: (self methodNamed: #trueIfTrueNestedAndParallelMethod);
		run.
	self assert: result isCollection.
	self assert: result size equals: 4.
	self assert: (result inject: true into: [ :bool :each | bool and: [ each selector name = #ifTrue: ] ])
]

{ #category : #tests }
FASTERTrueIfTrueSearchTest >> testTrueIfTrueBlockSearchInTrueIfTrueNestedMethod [
	| result |
	result := search
		scope: (self methodNamed: #trueIfTrueNestedMethod);
		run.
	self assert: result isCollection.
	self assert: result size equals: 2.
	self assert: (result inject: true into: [ :bool :each | bool and: [ each selector name = #ifTrue: ] ])
]
