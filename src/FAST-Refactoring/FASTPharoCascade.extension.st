Extension { #name : #FASTPharoCascade }

{ #category : #'*FAST-Refactoring-Core' }
FASTPharoCascade >> childrenNodes [
	^ { messages . receiver } asOrderedCollection
]
