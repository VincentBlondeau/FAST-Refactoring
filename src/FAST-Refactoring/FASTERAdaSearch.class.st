"
A FASTERTrueIfTrueSearch is xxxxxxxxx.

"
Class {
	#name : #FASTERAdaSearch,
	#superclass : #FASTERSearch,
	#category : #'FAST-Refactoring-Examples'
}

{ #category : #'as yet unclassified' }
FASTERAdaSearch >> searchFASTAdaProcedureCallOn: aCollectionOfFASTAdaCaseAlternative [
    <searchOn: #FASTAdaCaseAlternative>
    ^ self findInScope: #FASTAdaProcedureCall where: [ :node | node name matches: '*SEND(*' ] 
]

{ #category : #'as yet unclassified' }
FASTERAdaSearch >> searchRoot [
	<search>
	^ self findInScope: #FASTAdaCaseAlternative
]
