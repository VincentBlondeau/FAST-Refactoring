"
A FASTERTransformTrueIfTrueBlockTest is a test class for testing the true ifTrue: [ .. ] inlinement transformation .

Note: the transformation doesn't work for the cascaded ifTrue
"
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
FASTERTransformTrueIfTrueBlockTest >> testTrueIfTrueBlockCascadeRemovalTransformation [
	| result fasterTransform |
	fasterTransform := fasterInstance scope: (self methodNamed: #trueIfTrueCascadeMethod).
	result := fasterTransform run.
	self
		assert: result print
		equals:
			'trueIfTrueNestedMethod
	self  foo;  inlineMethod;  bar.
	self'
]

{ #category : #tests }
FASTERTransformTrueIfTrueBlockTest >> testTrueIfTrueBlockNestedAndParallelRemovalTransformation [
	| result fasterTransform |
	fasterTransform := fasterInstance scope: (self methodNamed: #trueIfTrueNestedAndParallelMethod).
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
FASTERTransformTrueIfTrueBlockTest >> testTrueIfTrueBlockNestedRemovalTransformation [
	| result fasterTransform |
	fasterTransform := fasterInstance scope: (self methodNamed: #trueIfTrueNestedMethod).
	result := fasterTransform run.
	self
		assert: result  print
		equals:
			 'trueIfTrueNestedMethod
	self  foo;  inlineMethod;  bar.
	self'
]

{ #category : #tests }
FASTERTransformTrueIfTrueBlockTest >> testTrueIfTrueBlockRemovalTransformation [
	| result fasterTransform |
	fasterTransform := fasterInstance scope: (self methodNamed: #trueIfTrueMethod).
	result := fasterTransform run.
	self
		assert: result print
		equals:
			'trueIfTrueMethod
	self  foo;  inlineMethod;  bar'
]

{ #category : #tests }
FASTERTransformTrueIfTrueBlockTest >> testTrueIfTrueSimpleBlockRemovalTransformation [
	| result fasterTransform |
	fasterTransform := fasterInstance scope: (self methodNamed: #return1).
	result := fasterTransform run.
	self
		assert: result print
		equals:
			'return1
	^ 1'
]
