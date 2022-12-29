Class {
	#name : #FakerBasicPersonDummyModel,
	#superclass : #Object,
	#instVars : [
		'firstName',
		'lastName'
	],
	#category : #'Faker-Examples'
}

{ #category : #accessing }
FakerBasicPersonDummyModel >> firstName [
	^ firstName
]

{ #category : #accessing }
FakerBasicPersonDummyModel >> firstName: anObject [
	firstName := anObject
]

{ #category : #accessing }
FakerBasicPersonDummyModel >> lastName [
	^ lastName
]

{ #category : #accessing }
FakerBasicPersonDummyModel >> lastName: anObject [
	lastName := anObject
]
