Extension { #name : #FASTNamedEntity }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTNamedEntity >> childrenNodes [
	self flag: 'this is not really a child node...'.
	^ { famixNamedEntity } asOrderedCollection 
]
