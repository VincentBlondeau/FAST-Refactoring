Extension { #name : #FASTJavaVarDeclStatement }

{ #category : #'*FAST-Refactoring-Core' }
FASTJavaVarDeclStatement >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
