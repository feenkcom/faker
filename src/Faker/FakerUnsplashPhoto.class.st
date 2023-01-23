Class {
	#name : #FakerUnsplashPhoto,
	#superclass : #Object,
	#instVars : [
		'json'
	],
	#category : #'Faker-Support'
}

{ #category : #accessing }
FakerUnsplashPhoto >> description [
	^ self json at: #alt_description ifAbsent: [ '' ]
]

{ #category : #testing }
FakerUnsplashPhoto >> isSuccess [
	^ true
]

{ #category : #accessing }
FakerUnsplashPhoto >> json [
	^ json
]

{ #category : #accessing }
FakerUnsplashPhoto >> json: anObject [
	json := anObject
]

{ #category : #accessing }
FakerUnsplashPhoto >> regularUrl [
	^ self urls at: #regular ifAbsent: [ nil ]
]

{ #category : #accessing }
FakerUnsplashPhoto >> smallUrl [
	^ self urls at: #small ifAbsent: [ nil ]
]

{ #category : #accessing }
FakerUnsplashPhoto >> urls [
	^ self json at: #urls ifAbsent: [ #() ]
]

{ #category : #accessing }
FakerUnsplashPhoto >> user [
	^ self json at: #user ifAbsent: [ Dictionary new ]
]

{ #category : #accessing }
FakerUnsplashPhoto >> userName [
	^ self user at: #name ifAbsent: [ nil ]
]
