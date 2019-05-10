Class {
	#name : #FakerConfiguration,
	#superclass : #Object,
	#instVars : [
		'random'
	],
	#category : #'Faker-Base'
}

{ #category : #defaults }
FakerConfiguration >> defaultRandom [
	^ SharedRandom globalGenerator
]

{ #category : #initialization }
FakerConfiguration >> initialize [
	super initialize.
	random := self defaultRandom.
]

{ #category : #accessing }
FakerConfiguration >> random [
	<return: #Random>
	^ random
]

{ #category : #accessing }
FakerConfiguration >> random: aRandom [
	self 
		assert: [ aRandom isNotNil ] 
		description: [ 'Random instance must be non-nil' ].
	random := aRandom
]
