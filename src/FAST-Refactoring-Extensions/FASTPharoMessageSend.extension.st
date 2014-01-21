Extension { #name : #FASTPharoMessageSend }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTPharoMessageSend >> childrenNodes [
	self flag: 'Should we add invocation ?'.
	^ { concreteReceiver . selector } asOrderedCollection union: arguments
]

{ #category : #'*FAST-Refactoring-Extensions' }
FASTPharoMessageSend >> mooseNameOn: aStream [
	aStream nextPutAll: self selector name.
	aStream nextPutAll: ' arguments : ',self arguments asString
]
