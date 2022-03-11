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

{ #category : #initialization }
FakerModule >> ensureFaker [
	base ifNil: [ 
		self base: Faker new ] 
]

{ #category : #accessing }
FakerModule >> locales [
	<return: #FakerLocales>
	^ self base locales
]

{ #category : #actions }
FakerModule >> multiplier [
	^ self multiplierFor: #sample
]

{ #category : #actions }
FakerModule >> multiplierFor: aSelector [
	^ self base multiplier 
		target: [ self perform: aSelector ]
]

{ #category : #accessing }
FakerModule >> properties [
	<return: #FakerLocales>
	^ self base properties
]

{ #category : #accessing }
FakerModule >> rawBase [
	^ base
]

{ #category : #actions }
FakerModule >> sample: aCollection [
	"Return any random item from the collection"
	<return: #Object>
	^ self base sample: aCollection
]
