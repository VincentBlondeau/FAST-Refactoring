Extension { #name : #FASTJavaSeparator }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTJavaSeparator >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
