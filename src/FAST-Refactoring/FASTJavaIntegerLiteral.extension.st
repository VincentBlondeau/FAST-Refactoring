Extension { #name : #FASTJavaIntegerLiteral }

{ #category : #'*FAST-Refactoring-Core' }
FASTJavaIntegerLiteral >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
