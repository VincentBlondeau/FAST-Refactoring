Class {
	#name : #FASTERSearchTrueIfTrueBlockTest,
	#superclass : #FASTERTransformTest,
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #'as yet unclassified' }
FASTERSearchTrueIfTrueBlockTest >> fasterClass [
	^ FASTERSearchTrueIfTrueBlock
]

{ #category : #'as yet unclassified' }
FASTERSearchTrueIfTrueBlockTest >> testTrueIfTrueBlockNestedAndParallelSearch [
	| result fasterTransform |
	fasterTransform := FASTERSearchTrueIfTrueBlock new scope: (self methodNamed: #trueIfTrueNestedAndParallelMethod).
	result := fasterTransform run.
	self assert: result isCollection.
	self assert: result size equals: 4.

]
