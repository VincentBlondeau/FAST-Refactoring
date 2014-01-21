Extension { #name : #FASTJavaForStatement }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTJavaForStatement >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
