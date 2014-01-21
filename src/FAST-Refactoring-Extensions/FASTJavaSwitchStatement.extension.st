Extension { #name : #FASTJavaSwitchStatement }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTJavaSwitchStatement >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
