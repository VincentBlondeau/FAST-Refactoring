Extension { #name : #FASTJavaNullLiteral }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTJavaNullLiteral >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
