"
A FASTERTransformIfBlockInJava is a small example of a FAST transformation.

The purpose is to convert a Smalltalk if statement to a Java one.
The methods to transform the others parts of the method are not implemented.

In this transformation, the FAST method model is modified

"
Class {
	#name : #FASTERInOutTransformIfBlockInJava,
	#superclass : #FASTERTransform,
	#category : #'FAST-Refactoring-Transformation-Examples'
}

{ #category : #transformation }
FASTERInOutTransformIfBlockInJava >> entryPoint [
	self find: FASTPharoMessageSend in: self scope where: [ :a | a selector name = #ifTrue: ].
	^ self apply: #pharoIfTrueStatementToJavaIfStatement on: (result at: 0) first
]

{ #category : #transformation }
FASTERInOutTransformIfBlockInJava >> pharoExpressionToJavaExpression: aNode [
	<transformOn: #FASTExpression>
	self flag: 'To implement'.
	^ aNode
]

{ #category : #transformation }
FASTERInOutTransformIfBlockInJava >> pharoIfTrueStatementToJavaIfStatement: aNode [
	<transformOn: #FASTPharoMessageSend>
	| ifJavaBlock fastStatementBlock |
	ifJavaBlock := FASTJavaIfStatement new.
	aNode parentNode parentNode add: ifJavaBlock insteadOf: aNode parentNode in: #statements.
	ifJavaBlock condition: (self apply: #pharoExpressionToJavaExpression on: aNode concreteReceiver).
	fastStatementBlock := FASTStatementBlock new statements: aNode arguments first block statements.
	ifJavaBlock thenBody: (self apply: #pharoStatementBlockToJavaStatementBlock on: fastStatementBlock).
	^ ifJavaBlock
]

{ #category : #transformation }
FASTERInOutTransformIfBlockInJava >> pharoStatementBlockToJavaStatementBlock: aNode [
	<transformOn: #FASTStatementBlock>
	self flag: 'To implement'.
	^ aNode
]
