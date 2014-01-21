Extension { #name : #FASTLiteral }

{ #category : #'*FAST-Refactoring-Core' }
FASTLiteral >> mooseNameOn: aStream [
	aStream nextPutAll: self value.
	aStream nextPutAll: Character space.
	aStream nextPutAll: self name.
]
