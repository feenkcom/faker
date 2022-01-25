Class {
	#name : #FakerCoordinates,
	#superclass : #FakerModule,
	#instVars : [
		'longitude',
		'latitude'
	],
	#category : #'Faker-Modules'
}

{ #category : #accessing }
FakerCoordinates class >> inEurope [
	^ self new inEurope
]

{ #category : #accessing }
FakerCoordinates class >> randomLocation [
	^ self new randomLocation
]

{ #category : #accessing }
FakerCoordinates >> inEurope [
	latitude := self base random nextBetween: 35 and: 72.
	longitude := self base random nextBetween: -10 and: 50.
]

{ #category : #accessing }
FakerCoordinates >> latitude [
	^ latitude
]

{ #category : #accessing }
FakerCoordinates >> longitude [
	^ longitude
]

{ #category : #accessing }
FakerCoordinates >> randomLocation [
	latitude := self base random nextBetween: -90 and: 90.
	longitude := self base random nextBetween: -180 and: 180
]
