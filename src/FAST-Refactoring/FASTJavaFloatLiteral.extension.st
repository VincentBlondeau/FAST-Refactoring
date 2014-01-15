Extension { #name : #FASTJavaFloatLiteral }

{ #category : #'*FAST-Refactoring-Core' }
FASTJavaFloatLiteral >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
