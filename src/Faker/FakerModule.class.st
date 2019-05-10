Class {
	#name : #FakerModule,
	#superclass : #Object,
	#instVars : [
		'base'
	],
	#category : #'Faker-Modules'
}

{ #category : #accessing }
FakerModule >> base [
	self 
		assert: [ base isNotNil ] 
		description: [ 'Faker base instance must be initialized before using it' ].
	^ base
]

{ #category : #accessing }
FakerModule >> base: aFaker [
	self 
		assert: [ aFaker isNotNil ] 
		description: [ 'Faker base instance must be non-nil' ].
	base := aFaker
]

{ #category : #accessing }
FakerModule >> locales [
	<return: #FakerLocales>
	^ self base locales
]
