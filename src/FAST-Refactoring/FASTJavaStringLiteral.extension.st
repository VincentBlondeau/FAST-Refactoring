Extension { #name : #FASTJavaStringLiteral }

{ #category : #'*FAST-Refactoring-Core' }
FASTJavaStringLiteral >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
