Extension { #name : #FASTPharoCascade }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTPharoCascade >> childrenNodes [
	^ { messages . receiver } asOrderedCollection
]
