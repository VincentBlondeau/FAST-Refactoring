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
		withCenteredText.
	builder nodes: self elements.
	builder edgesFrom: #parentNode.
	builder interaction action: #inspect.
	builder treeLayout verticalGap: 50.
	builder open.
	builder view edges
		do: [ :edge | 
			| lbl |
			lbl := (ROLabel text: (self selectorFrom: edge from model to: edge to model) asString) element.
			builder view add: lbl.
			ROConstraint stick: lbl onEdge: edge ]
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

{ #category : #display }
FASTERDisplay >> selectorFrom: aRootNode to: aSubNode [
	| selectorCollection |
	selectorCollection := self selectorsFromANode: aRootNode.
	^ selectorCollection
		detect:
			[ :selector | 
			| result |
			result := aRootNode perform: selector.
			result isCollection
				ifTrue: [ result includes: aSubNode ]
				ifFalse: [ result = aSubNode ] ] ifNone: [ #NOTFOUND ]
]

{ #category : #accessing }
FASTERDisplay >> selectorsFromANode: aNode [
	^ aNode allDeclaredProperties collect: [ :prop | prop name ]
]
