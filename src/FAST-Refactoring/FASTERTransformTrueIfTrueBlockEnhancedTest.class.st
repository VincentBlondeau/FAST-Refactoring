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
FASTERTransformTrueIfTrueBlockEnhancedTest >> testTrueIfTrueBlockCascadeRemovalTransformation [
	| result fasterTransform |
	fasterTransform := FASTERTransformTrueIfTrueBlockEnhanced new scope: (self methodNamed: #trueIfTrueCascadeMethod).
	result := fasterTransform run.
	self
		assert: result print
		equals:
			 'trueIfTrueNestedMethod
	self  foo;  inlineMethod;  bar.
	self'
]

{ #category : #tests }
FASTERTransformTrueIfTrueBlockEnhancedTest >> testTrueIfTrueBlockNestedAndParallelRemovalTransformation [
	| result fasterTransform |
	(self methodNamed: #trueIfTrueNestedAndParallelMethod) display.
	fasterTransform := FASTERTransformTrueIfTrueBlockEnhanced new scope: (self methodNamed: #trueIfTrueNestedAndParallelMethod).
	result := fasterTransform run.
	
	self
		assert: result print
		equals:
			'trueIfTrueNestedAndParallelMethod
	self  foo1;  inlineMethod1;  bar1.
	self m1.
	self  bar2;  inlineMethod2;  foo2.
	self m2' 
]

{ #category : #tests }
FASTERTransformTrueIfTrueBlockEnhancedTest >> testTrueIfTrueBlockNestedRemovalTransformation [
	| result fasterTransform |
	fasterTransform := FASTERTransformTrueIfTrueBlockEnhanced new scope: (self methodNamed: #trueIfTrueNestedMethod).
	result := fasterTransform run.
	self
		assert: result  print
		equals:
			 'trueIfTrueNestedMethod
	self  foo;  inlineMethod;  bar.
	self'
]

{ #category : #tests }
FASTERTransformTrueIfTrueBlockEnhancedTest >> testTrueIfTrueBlockRemovalTransformation [
	| result fasterTransform |
	fasterTransform := FASTERTransformTrueIfTrueBlockEnhanced new scope: (self methodNamed: #trueIfTrueMethod).
	result := fasterTransform run.
	self
		assert: result print
		equals:
			'trueIfTrueMethod
	self  foo;  inlineMethod;  bar'
]
