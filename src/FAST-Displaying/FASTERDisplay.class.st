"
A FASTERDisplay class is a graphic displayer for FAST (Or any model f extended - see below).
With this you can send ""display"" to any entity (or a collection of entities) of a FAST model, to show with Roassal Mondrian a tree representing the model.

The nodes are the objects of the model.
The edges are displayed if there is a kinsfolk (relationship between parents and children) between the nodes.

You can : 
- zoom in and out with the zoom buttons
- center on a node if you left click on it
- inspect a node or browse the related class by right clicking 

--- How to use the displayer for your model ? ---

If you want to use this tool for your model, you have to add the followings methods for each of your entities :
- parentNode : return the parent in the tree of your entity which is an entity
- childrenNodes : return the children in the first degree in the tree of your entity. The return must be a kind of collection (if you don't know the kind, put an OrderedCollection).
	If there are no children for the entity (leaves), simply return a empty orderedCollection.
- mooseName : can be implemented to show the label of the entity. See in FAST.

If some parentNode or childrenNode methods are not implemented on your model, the displayer will not work well...

--- Edges Labels explaination ---
Each edge between the parent and one of his child is labeled with the name of the method to access the child.
i.e. if a FASTMessageSend has a method named selector returning a FASTSelector. The link from the first to the second will be named selector.

If the method of the parent is returning a kind of collection (works also with FMMultilink), its index number will be appened to the label displayed.

The possible methods comes from allDeclaredProperties which use the FAME métadescription of the methods.

If the child is not accessible from the parent by any method the label is named NOTFOUND.
-----------------------------------------------------------------------------


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
FASTERDisplay class >> display: aFASTEntityOrCollection [
	self new display: aFASTEntityOrCollection
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
		item: 'inspect element' action: #inspect; "Actions on the right click"
		item: 'browse element class' action: [ :el | el browse ].
	builder shape rectangle
		size: 40;
		withCenteredText.
	builder nodes: self elements.
	builder edgesFrom: #parentNode.
	builder treeLayout verticalGap: 50. "Size between the lines of the tree. By default we can't see the edges"
	builder open.
	builder view edges
		do: [ :edge | 
			| lbl |
			lbl := (ROLabel text: (self selectorFrom: edge from model to: edge to model) asString) element.
			builder view add: lbl.
			ROConstraint stick: lbl onEdge: edge ]
]

{ #category : #display }
FASTERDisplay >> display: anEntityOrACollection [
	anEntityOrACollection isCollection
		ifTrue: [ self collectionOfFastEntities: anEntityOrACollection ]
		ifFalse: [ self fastEntity: anEntityOrACollection ].
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
