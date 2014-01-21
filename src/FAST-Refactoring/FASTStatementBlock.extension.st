Extension { #name : #FASTStatementBlock }

{ #category : #'*FAST-Refactoring-Core' }
FASTStatementBlock >> mooseNameOn: aStream [
	aStream nextPutAll: self name.
]
