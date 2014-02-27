Class {
	#name : #FASTERSearchTrueIfTrueBlockTest,
	#superclass : #FASTERTransformTest,
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #accessing }
FASTERSearchTrueIfTrueBlockTest >> fasterClass [
	^ FASTERSearchTrueIfTrueBlock
]

{ #category : #tests }
FASTERSearchTrueIfTrueBlockTest >> testTrueIfTrueBlockNestedAndParallelSearch [
	| result  |
	result := fasterInstance scope: (self methodNamed: #trueIfTrueNestedAndParallelMethod); run.
	self assert: result isCollection.
	self assert: result size equals: 4.

]
