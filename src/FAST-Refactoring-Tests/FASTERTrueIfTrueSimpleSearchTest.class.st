"
A FASTERTrueIfTrueSimpleSearchTest is a simple filtering (search) test class.
"
Class {
	#name : #FASTERTrueIfTrueSimpleSearchTest,
	#superclass : #FASTERSearchTest,
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #accessing }
FASTERTrueIfTrueSimpleSearchTest >> fasterClass [
	^ FASTERTrueIfTrueSearch
]

{ #category : #tests }
FASTERTrueIfTrueSimpleSearchTest >> testTrueIfTrueBlockSearch [
	| result |
	result := fasterInstance scope: self model allMethods; run.
	self assert: result isDictionary.
	self assert: result isNotEmpty.
	self assert: (result at: 0) isNotEmpty.
	self assert: ((result at: 0) inject: true into: [ :bool :each | bool and: [each selector name = #ifTrue: ] ])
]

{ #category : #tests }
FASTERTrueIfTrueSimpleSearchTest >> testTrueIfTrueBlockSearchInTrueIfTrueMethod [
	| result |
	result := fasterInstance scope: (self methodNamed: #trueIfTrueMethod); run.
	self assert: result isDictionary.
	self assert: (result at: 0) size equals: 1.
	self assert: ((result at: 0) inject: true into: [ :bool :each | bool and: [each selector name = #ifTrue: ] ])
]

{ #category : #tests }
FASTERTrueIfTrueSimpleSearchTest >> testTrueIfTrueBlockSearchInTrueIfTrueNestedAndParallelMethod [
	| result |
	result := fasterInstance
		scope: (self methodNamed: #trueIfTrueNestedAndParallelMethod);
		run.
	self assert: result isDictionary.
	self assert: (result at: 0) size equals: 4.
	self assert: ((result at: 0) inject: true into: [ :bool :each | bool and: [ each selector name = #ifTrue: ] ])
]

{ #category : #tests }
FASTERTrueIfTrueSimpleSearchTest >> testTrueIfTrueBlockSearchInTrueIfTrueNestedMethod [
	| result |
	result := fasterInstance
		scope: (self methodNamed: #trueIfTrueNestedMethod);
		run.
	self assert: result isDictionary.
	self assert: (result at: 0) size equals: 2.
	self assert: ((result at: 0) inject: true into: [ :bool :each | bool and: [ each selector name = #ifTrue: ] ])
]
