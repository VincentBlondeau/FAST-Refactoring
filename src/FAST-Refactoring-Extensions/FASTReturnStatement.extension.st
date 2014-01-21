Extension { #name : #FASTReturnStatement }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTReturnStatement >> childrenNodes [
	^ { expression } asOrderedCollection 
]

{ #category : #'*FAST-Refactoring-Extensions' }
FASTReturnStatement >> mooseNameOn: aStream [
	aStream nextPutAll: self name
]
