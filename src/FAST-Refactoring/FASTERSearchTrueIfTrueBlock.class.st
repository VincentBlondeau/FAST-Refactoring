"
A FASTERSearchTrueIfTrueBlock is an equivalent of FASTERTrueIfTrueSearch but using the  transform engine.

"
Class {
	#name : #FASTERSearchTrueIfTrueBlock,
	#superclass : #FASTERTransform,
	#category : #'FAST-Refactoring-Examples'
}

{ #category : #'transformation - rules' }
FASTERSearchTrueIfTrueBlock >> addIfTrueStatementToCollection: aNode [
	<transformOn: #FASTPharoMessageSend where: #isAnIfTrueStatement>
	| collection |
	collection := self apply: #searchInBehaviouralEntity on: aNode arguments first block.
	^ collection add: aNode; yourself 
]

{ #category : #'transformation - root' }
FASTERSearchTrueIfTrueBlock >> entryPoint [
	<search>
	^ self apply: #searchInBehaviouralEntity on: self scope fastNamedBehaviouralEntity
]

{ #category : #'transformation - boolean' }
FASTERSearchTrueIfTrueBlock >> isAnIfTrueStatement: aNode [
	^ aNode selector name = #ifTrue:
		and: [ (aNode receiver is: FASTBooleanLiteral) and: [ aNode receiver value = 'true' ] ]
]

{ #category : #'transformation - rules' }
FASTERSearchTrueIfTrueBlock >> searchInBehaviouralEntity: aNode [
	<transformOn: #FASTBehaviouralEntity>
	| result |
	result := OrderedCollection new.
	aNode statements 
		do: [ :statementNode | 
			result addAll: (self apply: #addIfTrueStatementToCollection on: statementNode).
		].
	^ result
]
