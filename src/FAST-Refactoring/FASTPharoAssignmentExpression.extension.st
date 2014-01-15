Extension { #name : #FASTPharoAssignmentExpression }

{ #category : #'*FAST-Refactoring-Core' }
FASTPharoAssignmentExpression >> childrenNodes [
	^ { variable . expression } asOrderedCollection  
]
