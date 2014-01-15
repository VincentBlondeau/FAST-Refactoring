"
A RBConjunctiveCondition is xxxxxxxxx.

Instance Variables
	failed:		<Object>
	left:		<Object>
	right:		<Object>

failed
	- xxxxx

left
	- xxxxx

right
	- xxxxx

"
Class {
	#name : #FASTRBConjunctiveCondition,
	#superclass : #FASTRBAbstractCondition,
	#instVars : [
		'left',
		'right',
		'failed'
	],
	#category : #'FAST-Refactoring-RBCore-Conditions'
}

{ #category : #checking }
FASTRBConjunctiveCondition >> check [
	left check
		ifFalse: 
			[failed := #leftFailed.
			^false].
	right check
		ifFalse: 
			[failed := #rightFailed.
			^false].
	^true
]

{ #category : #private }
FASTRBConjunctiveCondition >> errorBlockFor: aBoolean [ 
	^aBoolean
		ifTrue: [nil]
		ifFalse: 
			[failed = #leftFailed ifTrue: [left errorBlock] ifFalse: [right errorBlock]]
]

{ #category : #private }
FASTRBConjunctiveCondition >> errorMacro [
	^errorMacro isNil
		ifTrue: [self longMacro]
		ifFalse: [super errorMacro]
]

{ #category : #private }
FASTRBConjunctiveCondition >> errorStringFor: aBoolean [ 
	^aBoolean
		ifTrue: [self neitherFailed]
		ifFalse: [self perform: failed]
]

{ #category : #'initialize-release' }
FASTRBConjunctiveCondition >> left: aCondition right: aCondition2 [ 
	left := aCondition.
	right := aCondition2.
	failed := #unknownFailed
]

{ #category : #private }
FASTRBConjunctiveCondition >> leftFailed [
	^left errorStringFor: false
]

{ #category : #private }
FASTRBConjunctiveCondition >> longMacro [
	^'(' , left errorMacro , ') <1?AND:OR> (' , right errorMacro , ')'
]

{ #category : #private }
FASTRBConjunctiveCondition >> neitherFailed [
	^(left errorStringFor: true) , ' AND ' , (right errorStringFor: true)
]

{ #category : #printing }
FASTRBConjunctiveCondition >> printOn: aStream [ 
	aStream nextPutAll: left asString;
		nextPutAll: ' & ';
		nextPutAll: right asString

]

{ #category : #private }
FASTRBConjunctiveCondition >> rightFailed [
	^right errorStringFor: false
]

{ #category : #private }
FASTRBConjunctiveCondition >> unknownFailed [
	^(left errorStringFor: false) , ' OR ' , (right errorStringFor: false)
]
