Extension { #name : #FASTReturnStatement }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTReturnStatement >> childrenNodes [
	^ expression
]

{ #category : #'*FAST-Refactoring-Extensions' }
FASTReturnStatement >> mooseNameOn: aStream [
	aStream nextPutAll: self name
]
