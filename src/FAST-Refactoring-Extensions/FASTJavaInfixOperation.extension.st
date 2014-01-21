Extension { #name : #FASTJavaInfixOperation }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTJavaInfixOperation >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
