"
A FASTERInTransformSTToJavaTest is xxxxxxxxx.

"
Class {
	#name : #FASTERInOutTransformSTToJavaTest,
	#superclass : #FASTERTransformTest,
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #tests }
FASTERInOutTransformSTToJavaTest >> fasterClass [
	^ FASTERInOutTransformIfBlockInJava 
]

{ #category : #tests }
FASTERInOutTransformSTToJavaTest >> testIfTrueBlockJavaInOutTransformation [
	| ifTrueJavaCollection |

	search scope: (self methodNamed: #ifTrueMethod).

	ifTrueJavaCollection := search run.
	self assert: ifTrueJavaCollection isCollection.



]
