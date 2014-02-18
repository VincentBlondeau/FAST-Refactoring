"
A FASTERSearch is a abstract class allowing some search and transformation in a MooseModel.
Obviously, before any search, the FAST model should be already generated.


Instance Variables
	model:				a MooseModel 
	this: 				a FASTEntity 
	scope: 				a MooseEntity
	
model
	-  the Moose Model where the search or the transformation should be applied
scope
	- the entity we search into to find the elements
this - read only
	-  object containing the Moose object where you can do the transformation





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
		'scope',
		'result',
		'level'
	],
	#category : #'FAST-Refactoring-Core'
}

{ #category : #private }
FASTERSearch >> collectAllIn: aNode [
	^ aNode deepCollect: [ :each | each childrenNodes ]
]

{ #category : #'public  - searching' }
FASTERSearch >> find: aSearchedClass in: aNode [
	^ self find: aSearchedClass in: aNode where: [ :e | true ]
]

{ #category : #'public  - searching' }
FASTERSearch >> find: aSearchedClass in: aNode where: aBlock [
	| foundElements res |
	foundElements := (self collectAllIn: aNode)
		select: [ :element | 
			(element isAKindOf: aSearchedClass)
				and: [  
					level := level + 1.
					res := aBlock value: element.
					level := level - 1.
					res ] ].	"Mettre la cle sur la classe cherchée"
	foundElements ifNotEmpty: [ (self result at: level ifAbsentPut: [ OrderedCollection new ]) addAllFirstUnlessAlreadyPresent: foundElements ].
	^ foundElements isNotEmpty
]

{ #category : #'public  - searching' }
FASTERSearch >> findInScope: aSearchedClass [
	^ self find: aSearchedClass in: self scope
]

{ #category : #'public  - searching' }
FASTERSearch >> findInScope: aSearchedClass where: aBlock [
	^ self find: aSearchedClass in: self scope where: aBlock
]

{ #category : #'public  - searching' }
FASTERSearch >> initialize [
	super initialize.
	level := 0.
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
FASTERSearch >> result [
	^ result ifNil: [ result:= Dictionary new ]
]

{ #category : #'public - processing' }
FASTERSearch >> run [
	self entryPoint.
	^ self result
]

{ #category : #accessing }
FASTERSearch >> scope [ 
	^ scope ifNil: [ self model allMethods ]
]

{ #category : #accessing }
FASTERSearch >> scope: aScope [
	scope := aScope
]
