Class {
	#name : #FASTERTransformTrueIfTrueBlockEnhancedTest,
	#superclass : #FASTERTransformTest,
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #accessing }
FASTERTransformTrueIfTrueBlockEnhancedTest >> fasterClass [
	^ FASTERTransformTrueIfTrueBlockEnhanced
]

{ #category : #tests }
FASTERTransformTrueIfTrueBlockEnhancedTest >> testTrueIfTrueBlockNestedAndParallelRemovalTransformation [
	| result fasterTransform |
	fasterTransform := FASTERTransformTrueIfTrueBlockEnhanced new scope: (self methodNamed: #trueIfTrueNestedAndParallelMethod).
	result := fasterTransform run.
	result first display.
	result first print.
	self
		assert: result first print
		equals:
			'trueIfTrueMethod
	self  foo;  inlineMethod;  bar'
]

{ #category : #tests }
FASTERTransformTrueIfTrueBlockEnhancedTest >> testTrueIfTrueBlockRemovalTransformation [
	| result fasterTransform |
	fasterTransform := FASTERTransformTrueIfTrueBlockEnhanced new scope: (self methodNamed: #trueIfTrueMethod).
	result := fasterTransform run.
	result first display.
	"self
		assert: result first print
		equals:
			'trueIfTrueMethod
	self  foo;  inlineMethod;  bar'"
]
