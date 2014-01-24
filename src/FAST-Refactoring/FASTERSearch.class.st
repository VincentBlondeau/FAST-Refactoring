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
		'model',
		'this',
		'transformationClass',
		'scope'
	],
	#category : #'FAST-Refactoring-Core'
}

{ #category : #public }
FASTERSearch >> apply [
	| methodName |
	methodName := 'transform', this class asString.
	self perform: methodName asSymbol
]

{ #category : #searching }
FASTERSearch >> find: aSearchedClass [
	^ self find: aSearchedClass where: [ :e | true ]
]

{ #category : #searching }
FASTERSearch >> find: aSearchedClass where: aBlock [
	^ self findAll select: [ :element | element class = aSearchedClass and: [ aBlock value: element ] ]	"asFASTERCollection"
]

{ #category : #searching }
FASTERSearch >> findAll [
	^ self scope deepCollect: [ :each | each childrenNodes ]
]

{ #category : #accessing }
FASTERSearch >> model [
	^ model
]

{ #category : #accessing }
FASTERSearch >> model: anObject [
	model := anObject
]

{ #category : #accessing }
FASTERSearch >> scope [ 
	^ scope ifNil: [ self model allMethods ]
]

{ #category : #accessing }
FASTERSearch >> scope: aScope [
	scope := aScope
]

{ #category : #accessing }
FASTERSearch >> this [
	^ this
]

{ #category : #accessing }
FASTERSearch >> this: anObject [
	this := anObject
]

{ #category : #accessing }
FASTERSearch >> transformationClass [
	^ transformationClass
]

{ #category : #accessing }
FASTERSearch >> transformationClass: anObject [
	transformationClass := anObject
]
