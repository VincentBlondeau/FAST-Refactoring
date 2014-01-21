Extension { #name : #FASTJavaMethodInvocation }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTJavaMethodInvocation >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
