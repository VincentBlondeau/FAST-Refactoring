Extension { #name : #FASTJavaBreakStatement }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTJavaBreakStatement >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
