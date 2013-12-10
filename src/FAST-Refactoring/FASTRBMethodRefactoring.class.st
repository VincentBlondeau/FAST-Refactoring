"
A RBMethodRefactoring is xxxxxxxxx.

Instance Variables
	class:		<Object>

class
	- xxxxx

"
Class {
	#name : #FASTRBMethodRefactoring,
	#superclass : #FASTRBRefactoring,
	#instVars : [
		'class'
	],
	#category : #'FAST-Refactoring-Core-Refactorings'
}

{ #category : #private }
FASTRBMethodRefactoring >> buildSelectorString: aSelector [ 
	aSelector numArgs = 0 ifTrue: [^aSelector].
	^self buildSelectorString: aSelector
		withPermuteMap: (1 to: aSelector numArgs)
]

{ #category : #private }
FASTRBMethodRefactoring >> buildSelectorString: aSelector withPermuteMap: anIntegerCollection [ 
	| stream keywords |
	aSelector numArgs == 0 ifTrue: [^aSelector asString].
	stream := WriteStream on: String new.
	keywords := aSelector keywords.
	keywords with: anIntegerCollection
		do: 
			[:each :i | 
			stream
				nextPutAll: each;
				nextPutAll: ' ``@arg';
				nextPutAll: i printString;
				nextPut: $ ].
	^stream contents
]
