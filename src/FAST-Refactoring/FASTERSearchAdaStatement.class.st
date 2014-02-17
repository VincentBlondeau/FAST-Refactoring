"
A FASTERSearchAdaStatement is a implementation of the search of an equivalent of

messageSendSearch
    <search>
    ^ self find: FASTAdaCaseAlternative where: [ :a |
            a statements contains:  [ :s | (s is: FASTAdaProcedureCall)
                                                    and: [ s name matches: '*SEND(*' ] ]
        ] 

but which return directly the FASTAdaProcedureCall

"
Class {
	#name : #FASTERSearchAdaStatement,
	#superclass : #FASTERTransform,
	#category : #'FAST-Refactoring-Examples'
}

{ #category : #'transformation - root' }
FASTERSearchAdaStatement >> entryPoint [
	<search>
	^ self apply: #transformTrueIfTrueFrom on: self scope
]

{ #category : #'transformation - boolean' }
FASTERSearchAdaStatement >> nameMatchesSend: aNode [
	^ aNode name matches: '*SEND(*' 
]

{ #category : #'transformation - rules' }
FASTERSearchAdaStatement >> searchInFASTAdaCaseAlternative: aNode [
	<transformOn: #FASTAdaCaseAlternative>
	| result |
	result := OrderedCollection new.
	aNode statements 
		do: [ :statementNode | 
			result addAll: (self apply: #searchInFASTAdaProcedureCall on: statementNode).
		].
	^ result
]

{ #category : #'transformation - rules' }
FASTERSearchAdaStatement >> searchInFASTAdaProcedureCall: aNode [
	<transformOn: #FASTAdaProcedureCall where: #nameMatchesSend>
	| collection |
	collection := self apply: #searchInAdaCaseAlternative on: aNode.
	^ collection add: aNode; yourself 
]
