Extension { #name : #FASTJavaFloatLiteral }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTJavaFloatLiteral >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
