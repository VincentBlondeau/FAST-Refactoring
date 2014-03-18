"
A FASTERTransformIfBlockInJava is a small example of a FAST transformation.

The purpose is to convert a Smalltalk method to a Java one.

"
Class {
	#name : #FASTERInOutTransformIfBlockInJava,
	#superclass : #FASTERTransform,
	#category : #'FAST-Refactoring-Transformation-Examples'
}

{ #category : #transformation }
FASTERInOutTransformIfBlockInJava >> entryPoint [
	^ self find: FASTPharoMessageSend in: self scope where: [ :a | a selector name = #ifTrue: ]
]

{ #category : #transformation }
FASTERInOutTransformIfBlockInJava >> pharoExpressionToJavaExpression [
	<transformOn: FASTExpression>
	self flag: 'To implement'.
	^ inNode
]

{ #category : #transformation }
FASTERInOutTransformIfBlockInJava >> pharoIfTrueStatementToJavaIfStatement [
	<transformOn: FASTPharoMessageSend>
	<inout>	
	| ifJavaBlock fastStatementBlock |
	
	ifJavaBlock := FASTJavaIfStatement new.
	
	inNode parentNode parentNode add: ifJavaBlock insteadOf: inNode parentNode in:  #statements.
	
	ifJavaBlock condition: (inNode concreteReceiver --> FASTERInOutTransformIfBlockInJava).

	
	"Il faudra surement enlever le fast statement Block qui n'est plus utilisé en Smalltalk"
	fastStatementBlock := FASTStatementBlock new statements: inNode arguments first block statements.
	ifJavaBlock thenBody: (fastStatementBlock --> FASTERInOutTransformIfBlockInJava).
	^ ifJavaBlock
]

{ #category : #transformation }
FASTERInOutTransformIfBlockInJava >> pharoStatementBlockToJavaStatementBlock [
	<transformOn: FASTStatementBlock>
	self flag: 'To implement'.
	^ inNode
]

{ #category : #transformation }
FASTERInOutTransformIfBlockInJava >> pharoVariableExpressionToJavaExpression [
	<transformOn: FASTVariableExpression>
	self flag: 'To implement'.
	^ inNode
]
