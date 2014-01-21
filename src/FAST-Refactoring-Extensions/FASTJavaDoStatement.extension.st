Extension { #name : #FASTJavaDoStatement }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTJavaDoStatement >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
