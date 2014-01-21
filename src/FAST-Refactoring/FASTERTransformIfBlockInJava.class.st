Class {
	#name : #FASTERTransformIfBlockInJava,
	#superclass : #FASTERSearch,
	#category : #'FAST-Refactoring-Examples'
}

{ #category : #'as yet unclassified' }
FASTERTransformIfBlockInJava >> transformFASTExpression [
	self flag: 'To implement'.
	"self shouldBeImplemented "
]

{ #category : #'as yet unclassified' }
FASTERTransformIfBlockInJava >> transformFASTStatementBlock [
	"self shouldBeImplemented"
]

{ #category : #'as yet unclassified' }
FASTERTransformIfBlockInJava >> transformIfTrueBlock [
	| ifJavaBlock |
	ifJavaBlock := FASTJavaIfStatement new.
	this parentNode parentNode add: ifJavaBlock in: #statements; remove: this parentNode in: #statements.
	ifJavaBlock condition: (this concreteReceiver --> #transformFASTExpression).
	ifJavaBlock thenBody: (this arguments first block --> #transformFASTStatementBlock).
]
