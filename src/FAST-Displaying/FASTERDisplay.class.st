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
	| view labelNode  |
	view := ROMondrianViewBuilder new.
	view title: 'FAST Representation'.
	view interaction 
		on: ROMouseClick do:  [ :event |  
			ROFocusView on: event element ].
	view interaction 
		item: 'inspect element' action: #inspect;
		item: 'browse element class' action: [ :el | el browse ].
	view shape rectangle size: 40; 
		withCenteredText.
"		fillColor: (RONIdentityNormalizer new command: [ :e | e class name hash])."
"		linearFillColor: [ :e | e class name hash] within: self elements."
	view nodes: self elements.
	view edgesFrom: #parentNode.
	view interaction action: #inspect.
	view treeLayout.
	
	view shape label centeredLabel.
	labelNode := view node: 'Hello'.
	"ROConstraint stick: labelNode between: view edges first from and: view edges first to."
	
	"ROConstraint stick: labelNode onTheCenterOf: view edges second."
	view open
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
