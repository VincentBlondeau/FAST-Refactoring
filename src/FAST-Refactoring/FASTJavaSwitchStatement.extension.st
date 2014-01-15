Extension { #name : #FASTJavaSwitchStatement }

{ #category : #'*FAST-Refactoring-Core' }
FASTJavaSwitchStatement >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
