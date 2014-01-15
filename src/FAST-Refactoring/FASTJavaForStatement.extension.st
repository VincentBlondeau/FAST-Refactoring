Extension { #name : #FASTJavaForStatement }

{ #category : #'*FAST-Refactoring-Core' }
FASTJavaForStatement >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
