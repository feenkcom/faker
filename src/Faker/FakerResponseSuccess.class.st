Class {
	#name : #FakerResponseSuccess,
	#superclass : #FakerResponse,
	#instVars : [
		'data'
	],
	#category : #'Faker-Support'
}

{ #category : #accessing }
FakerResponseSuccess >> data [
	^ data
]

{ #category : #accessing }
FakerResponseSuccess >> data: anObject [
	data := anObject
]

{ #category : #testing }
FakerResponseSuccess >> isSuccess [
	^ true
]
