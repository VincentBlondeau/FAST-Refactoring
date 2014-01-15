Extension { #name : #FASTJavaIfStatement }

{ #category : #'*FAST-Refactoring-Core' }
FASTJavaIfStatement >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
