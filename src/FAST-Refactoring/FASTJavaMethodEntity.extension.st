Extension { #name : #FASTJavaMethodEntity }

{ #category : #'*FAST-Refactoring-Core' }
FASTJavaMethodEntity >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
