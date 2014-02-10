Class {
	#name : #FASTERTransformTrueIfTrueBlockTest,
	#superclass : #FASTERTransformTest,
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #accessing }
FASTERTransformTrueIfTrueBlockTest >> fasterClass [
	^ FASTERTransformTrueIfTrueBlock
]

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
	(self methodNamed: #trueIfTrueNestedMethod) display.
	fasterTransform := FASTERTransformTrueIfTrueBlock new scope: (self methodNamed: #trueIfTrueNestedMethod).
	result := fasterTransform run.
	self
		assert: result first print
		equals:
			'trueIfTrueNestedMethod
	self  foo;  inlineMethod;  bar.
	self'
]
