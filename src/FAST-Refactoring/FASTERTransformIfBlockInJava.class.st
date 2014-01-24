Class {
	#name : #FASTERTransformIfBlockInJava,
	#superclass : #FASTERSearch,
	#category : #'FAST-Refactoring-Examples'
}

{ #category : #'as yet unclassified' }
FASTERTransformIfBlockInJava >> transformFASTExpression [
	self flag: 'To implement'.
	^ this
]

{ #category : #'as yet unclassified' }
FASTERTransformIfBlockInJava >> transformFASTPharoMessageSend [
	| ifJavaBlock fastStatementBlock |
	ifJavaBlock := FASTJavaIfStatement new.
	this parentNode parentNode add: ifJavaBlock in: #statements; remove: this parentNode in: #statements.
	ifJavaBlock parentNode: this parentNode parentNode.
	ifJavaBlock condition: (this concreteReceiver" --> #FASTERTransformIfBlockInJava").
	ifJavaBlock condition parentNode: ifJavaBlock.
	fastStatementBlock := FASTStatementBlock new statements: this arguments first block statements.
	ifJavaBlock thenBody: (fastStatementBlock"--> #FASTERTransformIfBlockInJava").
	ifJavaBlock thenBody parentNode: ifJavaBlock.
]

{ #category : #'as yet unclassified' }
FASTERTransformIfBlockInJava >> transformFASTStatementBlock [
	self flag: 'To implement'.
	^ this
]

{ #category : #'as yet unclassified' }
FASTERTransformIfBlockInJava >> transformFASTVariableExpression [
	self flag: 'To implement'.
	^ this
]
