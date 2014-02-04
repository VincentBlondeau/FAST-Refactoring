"
A FASTERSeveralTransformationsAppliables is risen when there are more than 1 transformation appliable on a model. So you have to put more filters on your transformations.

"
Class {
	#name : #FASTERSeveralTransformationsAppliables,
	#superclass : #FASTERTransformationsNotProperlySet,
	#category : #'FAST-Refactoring-Exceptions'
}

{ #category : #message }
FASTERSeveralTransformationsAppliables >> errorText [
	^ String
		streamContents: [ :stream | 
			stream print: self transformationClass.
			stream << ' define too much possible transformations methods for '.
			stream print: self fastObject ]
]
