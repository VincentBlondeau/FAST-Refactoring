Extension { #name : #FASTJavaNullLiteral }

{ #category : #'*FAST-Refactoring-Core' }
FASTJavaNullLiteral >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
