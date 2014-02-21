"
A FASTERDisplay class is a graphic builder for FAST.

"
Class {
	#name : #FASTERDisplay,
	#superclass : #Object,
	#instVars : [
		'collectionOfFastEntities'
	],
	#category : #'FAST-Displaying'
}

{ #category : #display }
FASTERDisplay class >> display: aFASTEntity [
	self new display: aFASTEntity
]

{ #category : #display }
FASTERDisplay class >> displayCollection: aCollectionOfFASTEntity [
	self new displayCollection: aCollectionOfFASTEntity
]

{ #category : #accessing }
FASTERDisplay >> collectionOfFastEntities [
	^ collectionOfFastEntities
]

{ #category : #accessing }
FASTERDisplay >> collectionOfFastEntities: aCollection [
	collectionOfFastEntities := aCollection 
]

{ #category : #display }
FASTERDisplay >> display [
	| builder |
	builder := ROMondrianViewBuilder new.
	builder zoomInButton;zoomOutButton.
	builder title: 'FAST Representation'.
	builder interaction
		noPopup;
		on: ROMouseLeftClick
		do: [ :event | ROFocusView on: event element ];
		item: 'inspect element' action: #inspect;
		item: 'browse element class' action: [ :el | el browse ].
	builder shape rectangle
		size: 40;
		withCenteredText.
	builder nodes: self elements.
	builder edgesFrom: #parentNode.
	"builder interaction action: #inspect."
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

{ #category : #display }
FASTERDisplay >> displayCollection: aCollection [
	self collectionOfFastEntities: aCollection.
	self display
	
]

{ #category : #accessing }
FASTERDisplay >> elements [
	| elements |
	elements := collectionOfFastEntities flatCollect: [ :eachNode | eachNode deepCollect: [ :each | each childrenNodes ] ] as: OrderedCollection.
	elements := elements select: [ :e | e notNil and: [ e parentNode notNil ] ].
	"elements addAll: collectionOfFastEntities".
	^ elements
]

{ #category : #accessing }
FASTERDisplay >> fastEntity: anFastEntity [
	collectionOfFastEntities := OrderedCollection new add: anFastEntity ; yourself
]

{ #category : #selecting }
FASTERDisplay >> selectorFrom: aRootNode to: aSubNode [
	| selectorCollection |
	selectorCollection := self selectorsFromANode: aRootNode.
	selectorCollection
		do: [ :selector | 
			| result |
			result := aRootNode perform: selector.
			result isCollection
				ifTrue: [ 
					result isSequenceable
						ifTrue: [ 
							result
								withIndexDo: [ :element :index | 
									element = aSubNode
										ifTrue: [ ^ selector asString , index asString ] ] ]
						ifFalse: [ (result includes: aSubNode) ifTrue: [^ selector asString ]] ]
				ifFalse: [ 
					result = aSubNode
						ifTrue: [ ^ selector ] ] ].
	^ 'NOTFOUND'
]

{ #category : #accessing }
FASTERDisplay >> selectorsFromANode: aNode [
	^ aNode allDeclaredProperties collect: [ :prop | prop name ]
]
