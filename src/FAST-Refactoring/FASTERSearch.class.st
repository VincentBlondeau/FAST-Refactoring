"
A FASTERSearch is a abstract class allowing some search and transformation in a MooseModel.
Obviously, before any search, the FAST model should be already generated.

For applying a transformation, send the message --> to the root element with the symbol of the transformation class as parameter.

To be recognize as a transformation, the method in the transformation class as to wear the pragma : <transform> and should say on which kind of MooseClass she can understand by the pragma : <on: #FASTExpression> for example.

To add or remove some objects from a collection, you can use the methods :
add: in: -> adds an Object in a  IV (use the selector associated to the IV)
remove: in: -> removes an Object


Instance Variables
	model:				a MooseModel 
	this: 				a FASTEntity 
	transformationClass : a Class
	scope: 				a MooseEntity
	

model
	-  the Moose Model where the search or the transformation should be applied
scope
	- the entity we search into to find the elements
this - read only
	-  object containing the Moose object where you can do the transformation
transformationClass - private
	- the class where the transformation will be searched and executed




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

{ #category : #private }
FASTERSearch >> apply [
	| transformationPragma applicableTransformations |
	transformationPragma := Pragma allNamed: #transform in: self class.
	applicableTransformations := transformationPragma select: [ :aPragma | self this isApplicableTransformation: aPragma method ].
	applicableTransformations size ~= 1 ifTrue:
		[ FASTERTransformationsNotProperlySet signalTransformationClass: self class fastClass: this class ].
	self perform: applicableTransformations first method selector
]

{ #category : #'public  - searching' }
FASTERSearch >> find: aSearchedClass [
	^ self find: aSearchedClass where: [ :e | true ]
]

{ #category : #'public  - searching' }
FASTERSearch >> find: aSearchedClass where: aBlock [
	^ self findAll select: [ :element | element class = aSearchedClass and: [ aBlock value: element ] ]	"asFASTERCollection"
]

{ #category : #'public  - searching' }
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

{ #category : #private }
FASTERSearch >> this: aMooseEntity [
	this := aMooseEntity
]

{ #category : #accessing }
FASTERSearch >> transformationClass [
	^ transformationClass
]

{ #category : #accessing }
FASTERSearch >> transformationClass: anObject [
	transformationClass := anObject
]
