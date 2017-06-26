"
A FASTERSearch is a abstract class allowing some searches in a MooseModel.
Obviously, before any search, the FAST model should be already generated.

You can use this in any model if you have implemented the childrenNodes and  parentNode methods.

If you want to know how to use it, look at the examples and the documentation on what is a transformation.

Instance Variables
	scope: 				a MooseEntity
	level : 				an Integer
	result :  				an dictionary
					
scope
	- the entity we search (deep) into to find the elements
result 
	-  containing the result of a search into a dictionary. 
level 
	- indicates in which level the FASTERSearch is when using the where block. Used  for creating the result

"
Class {
	#name : #FASTERSearch,
	#superclass : #Object,
	#instVars : [
		'scope',
		'result',
		'level'
	],
	#category : #'FAST-Refactoring-Core'
}

{ #category : #private }
FASTERSearch >> collectAllIn: aNode [
	"Collect all the subNodes from a Node. Used for the search"
	^ aNode deepCollect: [ :each | each childrenNodes ]
]

{ #category : #'public - processing' }
FASTERSearch >> entryPoint [
	"The entryPoint must be implemented for each transformation or search. It's the beginning.
	If it's a transformation, this method must can the apply:on: method, else the transformation will be not executed."
	self subclassResponsibility
]

{ #category : #'public  - searching' }
FASTERSearch >> find: aSearchedClass as: aSymbol in: aNode [
	^ self find: aSearchedClass as: aSymbol in: aNode where: [ :e | true ]
]

{ #category : #'public  - searching' }
FASTERSearch >> find: aSearchedClass as: aSymbol in: aNode where: aBlock [
	"Find in all the subnodes of aNode, a node of the kind of aSearchedClass and whom the value of the block is true.
	Return a dictionary"

	| foundElements res |
	foundElements := (self collectAllIn: aNode)
		select: [ :element | 
			(element isKindOf: aSearchedClass)
				and: [ 
					level := level + 1.
					res := aBlock value: element.
					level := level - 1.
					res ] ].
	foundElements
		ifNotEmpty: [ 
			(self result 
				at: aSymbol 
				ifAbsentPut: [ OrderedCollection new ]) 
					addAllFirstUnlessAlreadyPresent: foundElements 
			].
	^ foundElements isNotEmpty
]

{ #category : #'public  - searching' }
FASTERSearch >> find: aSearchedClass in: aNode [
	^ self find: aSearchedClass in: aNode where: [ :e | true ]
]

{ #category : #'public  - searching' }
FASTERSearch >> find: aSearchedClass in: aNode where: aBlock [
	^ self find: aSearchedClass as: level in: aNode where: aBlock
]

{ #category : #'public  - searching' }
FASTERSearch >> initialize [
	super initialize.
	level := 0
]

{ #category : #accessing }
FASTERSearch >> result [
	^ result ifNil: [ result:= Dictionary new ]
]

{ #category : #'public - processing' }
FASTERSearch >> run [
	"Have to be called to launch the search"
	self entryPoint.
	^ self result
]

{ #category : #accessing }
FASTERSearch >> scope [ 
	^ scope
]

{ #category : #accessing }
FASTERSearch >> scope: aScope [
	scope := aScope
]
