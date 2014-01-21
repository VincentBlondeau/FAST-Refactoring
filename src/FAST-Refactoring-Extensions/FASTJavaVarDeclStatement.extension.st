Extension { #name : #FASTJavaVarDeclStatement }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTJavaVarDeclStatement >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
