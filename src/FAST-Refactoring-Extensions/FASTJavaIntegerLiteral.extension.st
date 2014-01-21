Extension { #name : #FASTJavaIntegerLiteral }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTJavaIntegerLiteral >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
