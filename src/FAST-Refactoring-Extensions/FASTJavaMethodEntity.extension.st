Extension { #name : #FASTJavaMethodEntity }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTJavaMethodEntity >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
