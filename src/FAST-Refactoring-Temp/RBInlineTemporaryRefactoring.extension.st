Extension { #name : #RBInlineTemporaryRefactoring }

{ #category : #'*FAST-Refactoring' }
RBInlineTemporaryRefactoring class >> node: aNode from: aSelector in: aClass [ 
	^self new 
		node: aNode
		from: aSelector
		in: aClass
]

{ #category : #'*FAST-Refactoring' }
RBInlineTemporaryRefactoring >> node: anInterval from: aSelector in: aClass [ 
	class := self classObjectFor: aClass.
	selector := aSelector.
	assignmentNode := anInterval
]
