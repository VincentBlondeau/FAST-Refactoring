Extension { #name : #FASTNamedEntity }

{ #category : #'*FAST-Refactoring-Core' }
FASTNamedEntity >> childrenNodes [
	self flag: 'this is not really a child node...'.
	^ famixNamedEntity
]
