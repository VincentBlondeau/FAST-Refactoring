Extension { #name : #FASTJavaDoStatement }

{ #category : #'*FAST-Refactoring-Core' }
FASTJavaDoStatement >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
