"
A FASTERTransformationDoesntExists is  is risen when the name you use for the transformation is not a selector.
So you have to implement the method.

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
