"
A FASTERParentNodeNotSet is an exception risen when the Parent Node of a FAST Object is not set.
But Parent Node has to be set by annotations on FAST methods.

This exception means that the FMMultilink collection is not well used.

You can resolve this by transforming the IV containing OrderedCollections in FMMultivalueLinks.
Or by set the parentNode automaticaly on affectation.



"
Class {
	#name : #FASTERParentNodeNotSet,
	#superclass : #FASTERException,
	#category : #'FAST-Refactoring-Exceptions'
}
