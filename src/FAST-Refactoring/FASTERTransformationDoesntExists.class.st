"
A FASTERTransformationDoesntExists is  is risen when there are no transformation appliable on a model. 
So you have to implement the method or change yours filters on your transformations.

"
Class {
	#name : #FASTERTransformationDoesntExists,
	#superclass : #FASTERTransformationsNotProperlySet,
	#category : #'FAST-Refactoring-Exceptions'
}

{ #category : #message }
FASTERTransformationDoesntExists >> errorText [
	^ String
		streamContents: [ :stream | 
			stream print: self transformationClass.
			stream << ' doesn''t define transformation methods for '.
			stream print: self fastObject ]
]
