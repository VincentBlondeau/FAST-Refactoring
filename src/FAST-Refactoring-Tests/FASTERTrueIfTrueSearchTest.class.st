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
	result := fasterInstance run.
	self assert: result isDictionary.
	self assert: result isNotEmpty.
	self assert: (result at: 0) isNotEmpty.
	self assert: ((result at: 0) inject: true into: [ :bool :each | bool and: [each selector name = #ifTrue: ] ])
]

{ #category : #tests }
FASTERTrueIfTrueSearchTest >> testTrueIfTrueBlockSearchInTrueIfTrueMethod [
	| result |
	result := fasterInstance scope: (self methodNamed: #trueIfTrueMethod); run.
	self assert: result isDictionary.
	self assert: (result at: 0) size equals: 1.
	self assert: ((result at: 0) inject: true into: [ :bool :each | bool and: [each selector name = #ifTrue: ] ])
]

{ #category : #tests }
FASTERTrueIfTrueSearchTest >> testTrueIfTrueBlockSearchInTrueIfTrueNestedAndParallelMethod [
	| result |
	result := fasterInstance
		scope: (self methodNamed: #trueIfTrueNestedAndParallelMethod);
		run.
	self assert: result isDictionary.
	self assert: (result at: 0) size equals: 4.
	self assert: ((result at: 0) inject: true into: [ :bool :each | bool and: [ each selector name = #ifTrue: ] ])
]

{ #category : #tests }
FASTERTrueIfTrueSearchTest >> testTrueIfTrueBlockSearchInTrueIfTrueNestedMethod [
	| result |
	result := fasterInstance
		scope: (self methodNamed: #trueIfTrueNestedMethod);
		run.
	self assert: result isDictionary.
	self assert: (result at: 0) size equals: 2.
	self assert: ((result at: 0) inject: true into: [ :bool :each | bool and: [ each selector name = #ifTrue: ] ])
]