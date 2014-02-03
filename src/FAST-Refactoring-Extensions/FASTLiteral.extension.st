Extension { #name : #FASTLiteral }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTLiteral >> childrenNodes [
	self flag: 'Send nil for the moment'.
	^ nil
]

{ #category : #'*FAST-Refactoring-Extensions' }
FASTLiteral >> mooseNameOn: aStream [
	aStream nextPutAll: self value.
	aStream nextPut: Character space.
	aStream nextPutAll: self name.
]
