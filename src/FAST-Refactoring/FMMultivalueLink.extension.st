Extension { #name : #FMMultivalueLink }

{ #category : #'*FAST-Refactoring-Core' }
FMMultivalueLink >> add: newObject after: oldObject [
	"Add the argument, newObject, as an element of the receiver. Put it in 
	the sequence just succeeding oldObject. Answer newObject."
	"Same Method that in OrderedCollection"

	| index |
	index := values find: oldObject.
	newObject perform: opposite with: owner.
	(values includes: newObject) not
		ifTrue: [ values insert: newObject before: index + 1 ].
	^ newObject
]

{ #category : #'*FAST-Refactoring-Core' }
FMMultivalueLink >> isSequencable [
 ^ true
]

{ #category : #'*FAST-Refactoring-Core' }
FMMultivalueLink >> reverseDo: aBlock [ 
	"Override the superclass for performance reasons."
	values reverseDo: aBlock
]
