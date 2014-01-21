Extension { #name : #FASTLiteral }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTLiteral >> childrenNodes [
	self flag: 'Send nil for the moment'.
	^ nil
]
