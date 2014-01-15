Extension { #name : #FASTJavaSeparator }

{ #category : #'*FAST-Refactoring-Core' }
FASTJavaSeparator >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
