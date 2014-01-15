Extension { #name : #FASTJavaCharacterLiteral }

{ #category : #'*FAST-Refactoring-Core' }
FASTJavaCharacterLiteral >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
