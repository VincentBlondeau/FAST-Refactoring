Extension { #name : #FASTPharoMessageSend }

{ #category : #'*FAST-Refactoring-Core' }
FASTPharoMessageSend >> mooseNameOn: aStream [
	aStream nextPutAll: self selector name.
	aStream nextPutAll: ' arguments : ',self arguments asString
]
