Extension { #name : #FASTJavaStringLiteral }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTJavaStringLiteral >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
