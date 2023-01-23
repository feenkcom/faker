Class {
	#name : #FakerResponse,
	#superclass : #Object,
	#instVars : [
		'response'
	],
	#category : #'Faker-Support'
}

{ #category : #testing }
FakerResponse >> isSuccess [
	^ false
]

{ #category : #accessing }
FakerResponse >> response [
	^ response
]

{ #category : #accessing }
FakerResponse >> response: anObject [
	response := anObject
]
