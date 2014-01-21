Extension { #name : #FASTReturnStatement }

{ #category : #'*FAST-Refactoring-Core' }
FASTReturnStatement >> childrenNodes [
	^ expression
]

{ #category : #'*FAST-Refactoring-Core' }
FASTReturnStatement >> mooseNameOn: aStream [
	aStream nextPutAll: self name
]