Class {
	#name : #FASTERTransformDoubleReturnBlockTest,
	#superclass : #FASTERTransformTest,
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #accessing }
FASTERTransformDoubleReturnBlockTest >> fasterClass [
	^ FASTERTransformDoubleReturnBlock
]

{ #category : #tests }
FASTERTransformDoubleReturnBlockTest >> testDoubleReturnRemovalTransformation [
	| result fasterTransform |
	fasterTransform := FASTERTransformDoubleReturnBlock new scope: (self methodNamed: #doubleReturnMethod).
	result := fasterTransform run.
	(self methodNamed: #doubleReturnMethod) display.
	self
		assert: result 
		equals:
			'trueIfTrueMethod
	self  foo;  inlineMethod;  bar'
]
