Extension { #name : #FASTJavaMethodInvocation }

{ #category : #'*FAST-Refactoring-Core' }
FASTJavaMethodInvocation >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
