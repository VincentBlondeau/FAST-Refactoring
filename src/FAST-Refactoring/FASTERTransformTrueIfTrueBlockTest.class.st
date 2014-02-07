Class {
	#name : #FASTERTransformTrueIfTrueBlockTest,
	#superclass : #FASTERSearchTest,
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #tests }
FASTERTransformTrueIfTrueBlockTest >> testTrueIfTrueBlockRemovalTransformation [
	| result fasterTransform |
	fasterTransform := FASTERTransformTrueIfTrueBlock new scope: (self methodNamed: #trueIfTrueMethod).
	result := fasterTransform run.
	self
		assert: result first print
		equals:
			'trueIfTrueMethod
	self  foo;  inlineMethod;  bar'
]

{ #category : #tests }
FASTERTransformTrueIfTrueBlockTest >> testTrueIfTrueNestedBlockRemovalTransformation [
	| fasterTransform result |
	fasterTransform := FASTERTransformTrueIfTrueBlock new scope: (self methodNamed: #trueIfTrueNestedMethod).
	result := fasterTransform run.
	self
		assert: result first print
		equals:
			'trueIfTrueNestedMethod
	self  foo;  inlineMethod;  bar.
	self'
]
