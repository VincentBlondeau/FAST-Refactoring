"
A RBNegationCondition is xxxxxxxxx.

Instance Variables
	condition:		<Object>

condition
	- xxxxx

"
Class {
	#name : #FASTRBNegationCondition,
	#superclass : #FASTRBAbstractCondition,
	#instVars : [
		'condition'
	],
	#category : #'FAST-Refactoring-Core-Conditions'
}

{ #category : #'instance creation' }
FASTRBNegationCondition class >> on: aCondition [
	^self new condition: aCondition
]

{ #category : #checking }
FASTRBNegationCondition >> check [
	^condition check not
]

{ #category : #'initialize-release' }
FASTRBNegationCondition >> condition: aCondition [ 
	condition := aCondition.
	self errorMacro: condition errorMacro
]

{ #category : #private }
FASTRBNegationCondition >> errorBlockFor: aBoolean [ 
	^condition errorBlockFor: aBoolean not
]

{ #category : #private }
FASTRBNegationCondition >> errorStringFor: aBoolean [ 
	^condition errorStringFor: aBoolean not
]

{ #category : #printing }
FASTRBNegationCondition >> printOn: aStream [ 
	aStream nextPutAll: 'NOT ';
		print: condition
]
