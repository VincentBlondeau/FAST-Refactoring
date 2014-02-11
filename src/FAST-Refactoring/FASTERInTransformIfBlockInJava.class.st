"
A FASTERTransformIfBlockInJava is a small example of a FAST transformation.

The purpose is to convert a Smalltalk method to a Java one.

"
Class {
	#name : #FASTERInTransformIfBlockInJava,
	#superclass : #FASTERTransform,
	#category : #'FAST-Refactoring-Examples'
}

{ #category : #transformation }
FASTERInTransformIfBlockInJava >> pharoFASTExpressionStatementToNewJavaExpressionStatement [
	<transformOn: FASTExpressionStatement>
	<in>
	
	^ FASTExpressionStatement new
]

{ #category : #transformation }
FASTERInTransformIfBlockInJava >> pharoFASTVariableExpressionToNewJavaVariableExpression [
	<transformOn: FASTVariableExpression>
	<in>

	^ FASTJavaVarDeclStatement new
]

{ #category : #transformation }
FASTERInTransformIfBlockInJava >> pharoIfTrueStatementToNewJavaIfStatement [
	<transformOn: FASTPharoMessageSend>
	<in>
	"For this example , we suppose that the JavaIfStatement is the root of the FAST model"
	| ifJavaBlock  |
	ifJavaBlock := FASTJavaIfStatement new.
	
	ifJavaBlock condition: (inNode concreteReceiver --> FASTERInTransformIfBlockInJava) first.

	ifJavaBlock thenBody: (FASTStatementBlock new statements: (inNode arguments first block statements --> FASTERInTransformIfBlockInJava)).
	
	"Don't forget to treat the block local variables "
	^ ifJavaBlock
]

{ #category : #transformation }
FASTERInTransformIfBlockInJava >> searchIfTrueMessage [
	<search>
	^ self find: FASTPharoMessageSend where: [ :a | a selector name = #ifTrue: ]
]
