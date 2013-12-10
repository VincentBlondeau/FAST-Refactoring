"
A RBAbstractCondition is xxxxxxxxx.

Instance Variables
	errorMacro:		<Object>

errorMacro
	- xxxxx

"
Class {
	#name : #FASTRBAbstractCondition,
	#superclass : #Object,
	#instVars : [
		'errorMacro'
	],
	#category : #'FAST-Refactoring-Core-Conditions'
}

{ #category : #'logical operations' }
FASTRBAbstractCondition >> & aCondition [ 
	^FASTRBConjunctiveCondition new left: self right: aCondition
]

{ #category : #checking }
FASTRBAbstractCondition >> check [
	self subclassResponsibility
]

{ #category : #accessing }
FASTRBAbstractCondition >> errorBlock [
	^self errorBlockFor: false
]

{ #category : #private }
FASTRBAbstractCondition >> errorBlockFor: aBoolean [ 
	^nil
]

{ #category : #private }
FASTRBAbstractCondition >> errorMacro [
	^errorMacro isNil
		ifTrue: ['unknown']
		ifFalse: [errorMacro]
]

{ #category : #private }
FASTRBAbstractCondition >> errorMacro: aString [ 
	errorMacro := aString
]

{ #category : #accessing }
FASTRBAbstractCondition >> errorString [
	^self errorStringFor: false
]

{ #category : #private }
FASTRBAbstractCondition >> errorStringFor: aBoolean [
	^self errorMacro expandMacrosWith: aBoolean
]

{ #category : #'logical operations' }
FASTRBAbstractCondition >> not [
	^FASTRBNegationCondition on: self
]

{ #category : #'logical operations' }
FASTRBAbstractCondition >> | aCondition [ 
	"(A | B) = (A not & B not) not"

	^(self not & aCondition not) not
]
