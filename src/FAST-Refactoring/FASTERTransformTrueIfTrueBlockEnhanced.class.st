"
A FASTERTransformTrueIfTrueBlock is a small example of a FAST transformation.

The purpose is to remove a true ifTrue: [  ] expression.



"
Class {
	#name : #FASTERTransformTrueIfTrueBlockEnhanced,
	#superclass : #FASTERTransform,
	#category : #'FAST-Refactoring-Transformation-Examples'
}

{ #category : #'transformation - root' }
FASTERTransformTrueIfTrueBlockEnhanced >> entryPoint [
	^ self apply: #transformTrueIfTrueFrom on: self scope fastNamedBehaviouralEntity
]

{ #category : #'transformation - rules' }
FASTERTransformTrueIfTrueBlockEnhanced >> getTrueIfTrueFrom: aNode [
	<transformOn: #FASTPharoMessageSend where: #isAnIfTrueStatement>
	| block |
	block := aNode arguments first block.
	self apply: #transformTrueIfTrueFrom on: block.
	^ block
]

{ #category : #'transformation - boolean' }
FASTERTransformTrueIfTrueBlockEnhanced >> isAnIfTrueStatement: aNode [
	^ aNode selector name = #ifTrue:
		and: [ (aNode receiver is: FASTBooleanLiteral) and: [ aNode receiver value = 'true' ] ]
]

{ #category : #'transformation - rules' }
FASTERTransformTrueIfTrueBlockEnhanced >> transformTrueIfTrueFrom: aNode [
	<transformOn: #FASTBehaviouralEntity>
	aNode statements copy
		do: [ :statementNode | 
			| behaviouralEntities statements localVariables |
			"Get the data from a deaper entity"
			behaviouralEntities := self apply: #getTrueIfTrueFrom on: statementNode.
			behaviouralEntities do: [ :aBehaviouralEntity |
					localVariables := aBehaviouralEntity localVariables.
					statements := aBehaviouralEntity statements.	
					"Affect the statements of the block to the upper BehaviouralEntity"
					aNode add: statements insteadOf: statementNode in: #statements.	
					"Move the variables of the block to the upper BehaviouralEntity"
					aNode addLast: localVariables in: #localVariables ].
			 ].
	^ aNode
]
