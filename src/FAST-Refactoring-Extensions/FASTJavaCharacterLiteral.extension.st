Extension { #name : #FASTJavaCharacterLiteral }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTJavaCharacterLiteral >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
