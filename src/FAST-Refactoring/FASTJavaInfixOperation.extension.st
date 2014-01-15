Extension { #name : #FASTJavaInfixOperation }

{ #category : #'*FAST-Refactoring-Core' }
FASTJavaInfixOperation >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
