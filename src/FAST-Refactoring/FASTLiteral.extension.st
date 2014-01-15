Extension { #name : #FASTLiteral }

{ #category : #'*FAST-Refactoring-Core' }
FASTLiteral >> childrenNodes [
	self flag: 'Send nil for the moment'.
	^ nil
]

{ #category : #'*FAST-Refactoring-Core' }
FASTLiteral >> mooseNameOn: aStream [
	aStream nextPutAll: self value.
	aStream nextPutAll: Character space.
	aStream nextPutAll: self name.
]
