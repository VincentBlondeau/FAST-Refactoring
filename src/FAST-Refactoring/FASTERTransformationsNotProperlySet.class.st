"
A FASTERTransformationsNotProperlySet is an exception risen when they are a number different of 1 applicable transformations.

If risen, check that :
the transformation you want to apply exists
both transformations can't apply on a same object.

The transformationClass is the class where the search is made.
The fastObject is the fastObject we want to transform



"
Class {
	#name : #FASTERTransformationsNotProperlySet,
	#superclass : #FASTERException,
	#instVars : [
		'transformationClass',
		'fastClass'
	],
	#category : #'FAST-Refactoring-Exceptions'
}

{ #category : #signalling }
FASTERTransformationsNotProperlySet class >> signalTransformationClass: aTransformationClass fastClass: aFastClass [
	^ self new transformationClass: aTransformationClass ;
		fastObject: aFastClass;
		signal
]

{ #category : #accessing }
FASTERTransformationsNotProperlySet >> fastObject [
	^ fastObject
]

{ #category : #accessing }
FASTERTransformationsNotProperlySet >> fastObject: anObject [
	fastObject := anObject
]

{ #category : #accessing }
FASTERTransformationsNotProperlySet >> transformationClass [
	^ transformationClass
]

{ #category : #accessing }
FASTERTransformationsNotProperlySet >> transformationClass: anObject [
	transformationClass := anObject
]
