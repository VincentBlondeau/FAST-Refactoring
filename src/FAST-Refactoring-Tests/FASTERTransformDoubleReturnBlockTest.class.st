"
A FASTERTransformDoubleReturnBlockTest is a class for testing transformation of  the inlinement of the return.

The transform is :
Before :
self 
ifTrue: [ self foo11; foo12. ^ self bar1 ]
ifFalse: [ self foo21; foo22.^ self bar2 ]
After:
^ self 
ifTrue: [ self foo11; foo12.  self bar1 ]
ifFalse: [ self foo21; foo22. self bar2 ]

But it is not finish..


"
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
	self
		assert: result 
		equals:
			'^ self
		ifTrue: [ 
			self
				foo11;
				foo12.
			self bar1 ]
		ifFalse: [ 
			self
				foo21;
				foo22.
			self bar2 ]'
]
