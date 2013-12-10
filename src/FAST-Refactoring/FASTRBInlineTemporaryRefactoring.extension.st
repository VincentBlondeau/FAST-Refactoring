Extension { #name : #FASTRBInlineTemporaryRefactoring }

{ #category : #'*FAST-Refactoring' }
FASTRBInlineTemporaryRefactoring classSide >> node: aNode from: aSelector in: aClass [ 
	^self new 
		node: aNode
		from: aSelector
		in: aClass
]

{ #category : #'*FAST-Refactoring' }
FASTRBInlineTemporaryRefactoring >> node: anInterval from: aSelector in: aClass [ 
	class := self classObjectFor: aClass.
	selector := aSelector.
	assignmentNode := anInterval
]
