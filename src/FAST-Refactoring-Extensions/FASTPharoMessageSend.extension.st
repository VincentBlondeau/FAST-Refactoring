Extension { #name : #FASTPharoMessageSend }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTPharoMessageSend >> childrenNodes [
	self flag: 'Should we add invocation ?'.
	{ arguments . concreteReceiver } asOrderedCollection  
]
