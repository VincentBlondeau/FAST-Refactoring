Extension { #name : #FASTJavaIfStatement }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTJavaIfStatement >> childrenNodes [
	{ condition . thenBody . elseBody } asOrderedCollection 
]
