"
A FASTERSearch is xxxxxxxxx.

Instance Variables
	model:		<Object>

model
	- xxxxx


| ""VI"" this ifPharoBlock ifJavaBlock statementsCollection localVariables |

""IfBlockPharo2Java::""
ifPharoBlock := self find: #FASTPharoMessageSend where: [ :a | a selector = #ifTrue and: [a concreteReceiver isFASTBooleanLiteral and: [ a concreteReceiver value = true]] ].
""ou""
ifPharoBlock := self find: #FASTPharoMessageSend where: {each selector = #ifTrue . each concreteReceiver isFASTBooleanLiteral . each concreteReceiver value = true }.
""ou""
ifPharoBlock := self find: #FASTPharoMessageSend where: #( selector = #ifTrue & concreteReceiver isFASTBooleanLiteral & concreteReceiver value = true ).

ifPharoBlock -> transformIfBlock.

""transformIfTrueBlock"" ""Pharo2Java""
ifJavaBlock := FASTJavaIfStatement new.
(this parentUntil: #FASTStatementBlock ""ou remonter deux fois ?"") statements: ifJavaBlock.""add  remove ""
ifJavaBlock condition: (this concreteReceiver -> transformFASTExpression).
ifJavaBlock thenBody: (this arguments first statementBlock -> transformFASTStatementBlock).


""refactoringtrueIftrue:""
statementsCollection := this arguments first block statementBlock statements.""deepCollect: #FASTExpressionStatement level: #FirstFound.""  ""precise que seul le premier niveau devra etre recupere""
(this parentUntil: #FASTStatementBlock) add: statementsCollection in: #statements; remove: this parent in: #statements. ""unicite dans la collection garantie par le mooseID""

localVariables := this arguments first block localVariables.""deepCollect: #FASTNamedEntity level: #FirstFound.""
(this parentUntil: #FASTAnonymousBehaviouralEntity) add: localVariables in: #localVariables. 

"
Class {
	#name : #FASTERSearch,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'FAST-Refactoring-Core'
}

{ #category : #searching }
FASTERSearch >> find: aClass where: aBlock [
	^(self model allMethods deepCollect: [ :each | each childrenNodes]) select: [ :element | element class = aClass and: [ aBlock value: element ] ]
	
]

{ #category : #accessing }
FASTERSearch >> model [
	^ model
]

{ #category : #accessing }
FASTERSearch >> model: anObject [
	model := anObject
]
