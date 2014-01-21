Extension { #name : #FASTStatementBlock }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTStatementBlock >> childrenNodes [
	^ statements
]

{ #category : #'*FAST-Refactoring-Extensions' }
FASTStatementBlock >> mooseNameOn: aStream [
	aStream nextPutAll: self name.
]
