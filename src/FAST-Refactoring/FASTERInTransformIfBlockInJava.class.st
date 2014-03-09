"
A FASTERInTransformIfBlockInJava is a small example of a FAST transformation.

The purpose is to convert a Smalltalk if statement to a Java one.
The methods to transform the others parts of the method are not implemented.

In this transformation, a new FAST method model is created

"
Class {
	#name : #FASTERInTransformIfBlockInJava,
	#superclass : #FASTERTransform,
	#category : #'FAST-Refactoring-Transformation-Examples'
}

{ #category : #transformation }
FASTERInTransformIfBlockInJava >> entryPoint [
	self find: FASTPharoMessageSend in: self scope where: [ :a | a selector name = #ifTrue: ].
	^ self apply: #pharoIfTrueStatementToNewJavaIfStatement on: (result at: 0) first
]

{ #category : #transformation }
FASTERInTransformIfBlockInJava >> pharoFASTExpressionStatementToNewJavaExpressionStatement: aNode [
	<transformOn: FASTExpressionStatement>
	self flag: 'To implement'.
	^ FASTExpressionStatement new
]

{ #category : #transformation }
FASTERInTransformIfBlockInJava >> pharoFASTVariableExpressionToNewJavaVariableExpression: aNode [
	<transformOn: FASTVariableExpression>
	self flag: 'To implement'.
	^ FASTJavaVarDeclStatement new
]

{ #category : #transformation }
FASTERInTransformIfBlockInJava >> pharoIfTrueStatementToNewJavaIfStatement: aNode [
	<transformOn: FASTPharoMessageSend>
	"For this example , we suppose that the JavaIfStatement is the root of the FAST model"
	| ifJavaBlock  |
	ifJavaBlock := FASTJavaIfStatement new.
	
	ifJavaBlock condition: (self apply: #pharoFASTVariableExpressionToNewJavaVariableExpression on: aNode) first .

	ifJavaBlock thenBody: (FASTStatementBlock new statements: (self apply: #pharoFASTExpressionStatementToNewJavaExpressionStatement on: aNode arguments first)).
	
	"Don't forget to treat the block local variables "
	^ ifJavaBlock
]
