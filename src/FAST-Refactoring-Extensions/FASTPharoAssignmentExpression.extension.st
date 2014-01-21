Extension { #name : #FASTPharoAssignmentExpression }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTPharoAssignmentExpression >> childrenNodes [
	^ { variable . expression } asOrderedCollection  
]
