"
de
	^ FakerDeLocales uniqueInstance
"
Class {
	#name : #FakerLocales,
	#superclass : #FakerModule,
	#category : #'Faker-Locales'
}

{ #category : #public }
FakerLocales class >> de [
	^ FakerDeLocales new
]

{ #category : #public }
FakerLocales class >> default [
	^ self de
]
