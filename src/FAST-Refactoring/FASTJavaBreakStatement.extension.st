Extension { #name : #FASTJavaBreakStatement }

{ #category : #'*FAST-Refactoring-Core' }
FASTJavaBreakStatement >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
