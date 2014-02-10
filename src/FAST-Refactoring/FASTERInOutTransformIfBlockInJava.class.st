"
A FASTERTransformIfBlockInJava is a small example of a FAST transformation.

The purpose is to convert a Smalltalk method to a Java one.

"
Class {
	#name : #FASTERInOutTransformIfBlockInJava,
	#superclass : #FASTERTransform,
	#category : #'FAST-Refactoring-Examples'
}

{ #category : #transformation }
FASTERInOutTransformIfBlockInJava >> pharoExpressionToJavaExpression [
	<transformOn: FASTExpression>
	self flag: 'To implement'.
	^ this
]

{ #category : #transformation }
FASTERInOutTransformIfBlockInJava >> pharoIfTrueStatementToJavaIfStatement [
	<transformOn: FASTPharoMessageSend>
	<inout>	
	| ifJavaBlock fastStatementBlock |
	
	ifJavaBlock := FASTJavaIfStatement new.
	this parentNode parentNode add: ifJavaBlock in: #statements; remove: this parentNode from: #statements.
	
	ifJavaBlock condition: (this concreteReceiver --> FASTERInOutTransformIfBlockInJava).

	
	"Il faudra surement enlever le fast statement Block qui n'est plus utilisé en Smalltalk"
	fastStatementBlock := FASTStatementBlock new statements: this arguments first block statements.
	ifJavaBlock thenBody: (fastStatementBlock --> FASTERInOutTransformIfBlockInJava).
	^ ifJavaBlock
]

{ #category : #transformation }
FASTERInOutTransformIfBlockInJava >> pharoStatementBlockToJavaStatementBlock [
	<transformOn: FASTStatementBlock>
	self flag: 'To implement'.
	^ this
]

{ #category : #transformation }
FASTERInOutTransformIfBlockInJava >> pharoVariableExpressionToJavaExpression [
	<transformOn: FASTVariableExpression>
	self flag: 'To implement'.
	^ this
]

{ #category : #transformation }
FASTERInOutTransformIfBlockInJava >> searchIfTrueMessage [
	<search>
	^ self find: FASTPharoMessageSend where: [ :a | a selector name = #ifTrue: ]
]
