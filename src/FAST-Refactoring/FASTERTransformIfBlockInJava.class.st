"
A FASTERTransformIfBlockInJava is a small example of a FAST transformation.

The purpose is to convert a Smalltalk method to a Java one.

"
Class {
	#name : #FASTERTransformIfBlockInJava,
	#superclass : #FASTERSearch,
	#category : #'FAST-Refactoring-Examples'
}

{ #category : #'as yet unclassified' }
FASTERTransformIfBlockInJava >> pharoExpressionToJavaExpression [
	<transform>
	<on: FASTExpression>
	self flag: 'To implement'.
	^ this
]

{ #category : #'as yet unclassified' }
FASTERTransformIfBlockInJava >> pharoIfTrueStatementToJavaIfStatement [
	<transform>
	<on: FASTPharoMessageSend>
	
	| ifJavaBlock fastStatementBlock |
	ifJavaBlock := FASTJavaIfStatement new.
	this parentNode parentNode add: ifJavaBlock in: #statements; remove: this parentNode in: #statements.

	"Should be remove ASAP the FMMultilink issue solved !"
	ifJavaBlock parentNode: this parentNode parentNode.
	
	ifJavaBlock condition: (this concreteReceiver --> #FASTERTransformIfBlockInJava).
	
	ifJavaBlock condition parentNode: ifJavaBlock.
	
	"Il faudra surement enlver le fast statement Block qui n'est plus utilisé en Smalltalk"
	fastStatementBlock := FASTStatementBlock new statements: this arguments first block statements.
	ifJavaBlock thenBody: (fastStatementBlock --> #FASTERTransformIfBlockInJava).
	ifJavaBlock thenBody parentNode: ifJavaBlock.
]

{ #category : #'as yet unclassified' }
FASTERTransformIfBlockInJava >> pharoStatementBlockToJavaStatementBlock [
	<transform>
	<on: FASTStatementBlock>
	self flag: 'To implement'.
	^ this
]

{ #category : #'as yet unclassified' }
FASTERTransformIfBlockInJava >> pharoVariableExpressionToJavaExpression [
	<transform>
	<on: FASTVariableExpression>
	self flag: 'To implement'.
	^ this
]
