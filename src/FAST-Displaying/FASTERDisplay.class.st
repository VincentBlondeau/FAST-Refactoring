"
A FASTERDisplay class is a graphic builder for FAST.

"
Class {
	#name : #FASTERDisplay,
	#superclass : #Object,
	#instVars : [
		'fastEntity'
	],
	#category : #'FAST-Displaying'
}

{ #category : #display }
FASTERDisplay class >> display: aFASTEntity [
	self new display: aFASTEntity
]

{ #category : #display }
FASTERDisplay >> display [
	| builder |
	builder := ROMondrianViewBuilder new.
	builder title: 'FAST Representation'.
	builder interaction
		on: ROMouseClick
		do: [ :event | ROFocusView on: event element ].
	builder interaction
		item: 'inspect element' action: #inspect;
		item: 'browse element class' action: [ :el | el browse ].
	builder shape rectangle
		size: 40;
		withCenteredText.	"		fillColor: (RONIdentityNormalizer new command: [ :e | e class name hash])."	"		linearFillColor: [ :e | e class name hash] within: self elements."
	builder nodes: self elements.
	builder edgesFrom: #parentNode.
	builder interaction action: #inspect.
	builder treeLayout.	"ROConstraint stick: labelNode onTheCenterOf: view edges second."
	builder open.
	builder view edges do: [ :edge | 
			| lbl |
			lbl := (ROLabel text: 'hello world') element.
			builder view add: lbl.
			ROConstraint stick: lbl between: edge from and: edge to 
	]
]

{ #category : #display }
FASTERDisplay >> display: anEntity [
	self fastEntity: anEntity.
	self display
	
]

{ #category : #accessing }
FASTERDisplay >> elements [
	| elements |
	elements := fastEntity deepCollect: [:each | each childrenNodes ].
	elements := elements select: [ :e | e notNil and: [ e parentNode notNil ]].
	elements add: fastEntity.
	^ elements 
]

{ #category : #accessing }
FASTERDisplay >> fastEntity [
	^ fastEntity
]

{ #category : #accessing }
FASTERDisplay >> fastEntity: anObject [
	fastEntity := anObject
]
