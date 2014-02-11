"
A FASTERTransformTrueIfTrueBlock is a small example of a FAST transformation.

The purpose is to remove a true ifTrue: [  ] expression.



"
Class {
	#name : #FASTERTransformTrueIfTrueBlockEnhanced,
	#superclass : #FASTERTransform,
	#category : #'FAST-Refactoring-Examples'
}

{ #category : #transformation }
FASTERTransformTrueIfTrueBlockEnhanced >> entryPoint [
	<search>
	^ self scope fastNamedBehaviouralEntity 
]

{ #category : #transformation }
FASTERTransformTrueIfTrueBlockEnhanced >> flattenCollectionContaningDictionaries: aCollection [
	"^ aCollection isSequenceable ifTrue: [  self flattenSequenceableCollection: (aCollection flatCollect: [ :e | e isSequenceable ifTrue: [ e ] ifFalse: [nil] ]) ] ifFalse: [ aCollection ]"
	"aCollection deepCollect: [ :e | e ifNotNil: [ e isDictionary ifFalse: [ e contents ] ifTrue: [ ^e ]]]. ^ nil"
	| result |
	result := OrderedCollection new.
	aCollection 
		deep: [ :e | e ] 
		do: [ :each | each isDictionary ifTrue: [ result add: each] ].
	^ result
]

{ #category : #transformation }
FASTERTransformTrueIfTrueBlockEnhanced >> trueIfTrueTransformFASTBehaviouralEntity [
	"should be FASTPharoMethodEntity or FASTPharoBlockDefinition"
	<transformOn: #FASTBehaviouralEntity>
	inNode copy statements
		do: [ :statementNode | | result  statements localVariables |
			statementNode ifNotNil: [
			result := self flattenCollectionContaningDictionaries: (statementNode --> self class).
			result do: [ :aDictionary |
			localVariables := aDictionary at: #localVariables.
			statements := aDictionary at: #statements.	
			"Affect the statements of the block to the upper BehaviouralEntity"
			inNode add: statements insteadOf: statementNode in: #statements.
			"Move the variables of the block to the upper BehaviouralEntity" 
			inNode addLast: localVariables in: #localVariables ].
		] ].
		^ inNode
]

{ #category : #transformation }
FASTERTransformTrueIfTrueBlockEnhanced >> trueIfTrueTransformFASTPharoMessageSend [
	<transformOn: #FASTPharoMessageSend>
	"<where: #isTrueMethod>"
	(inNode selector name = #ifTrue:
		and: [ (inNode receiver is: FASTBooleanLiteral) and: [ inNode receiver value = 'true' ] ])
		ifTrue: [
			^ {(#localVariables -> inNode arguments first block localVariables).
			(#statements -> inNode arguments first block statements)} asDictionary.
			 ] ifFalse: [ ^ self defaultRule ]
]
