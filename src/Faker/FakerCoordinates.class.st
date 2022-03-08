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
FakerCoordinates class >> inAfrica [
	^ self new
		base: (Faker new);
		inAfrica.
]

{ #category : #accessing }
FakerCoordinates class >> inAsia [
	^ self new
		base: (Faker new);
		inAsia.
]

{ #category : #accessing }
FakerCoordinates class >> inAustralia [
	^ self new
		base: (Faker new);
		inAustralia.
]

{ #category : #accessing }
FakerCoordinates class >> inEurope [
	^ self new 
		base: (Faker new);
		inEurope
]

{ #category : #accessing }
FakerCoordinates class >> inNorthAmerica [
	^ self new
		base: (Faker new);
		inNorthAmerica.
]

{ #category : #accessing }
FakerCoordinates class >> inSouthAmerica [
	^ self new
		base: (Faker new);
		inSouthAmerica.
]

{ #category : #accessing }
FakerCoordinates class >> randomLocation [
	^ self new 
		base: (Faker new);
		randomLocation
]

{ #category : #accessing }
FakerCoordinates >> inAfrica [
	|possibleSegments|
	
	possibleSegments := {
		"Northern segment"
		[
			self longitudeBetween: -17 and: 35.
			self latitudeBetween: 5 and: 35.
		].
		"Southern segement"
		[
			self longitudeBetween: 10 and: 45.
			self latitudeBetween: -35 and: 5.
		].
	}.
	(self base sample: possibleSegments) value.
]

{ #category : #accessing }
FakerCoordinates >> inAsia [
	|possibleSegments|
	
	possibleSegments := {
		"Northern Asia"
		[
			self longitudeBetween: 60 and:160.
			self latitudeBetween: 40 and: 90.
		].
		"Middle East"
		[
			self longitudeBetween: 35 and: 60.
			self latitudeBetween: 20 and: 45.
		].
		"Central & South Asia"
		[
			self longitudeBetween: 60 and: 120.
			self latitudeBetween: 10 and: 40.
		].
		"South-East Asia"
		[
			self longitudeBetween: 90 and: 135.
			self latitudeBetween: -10 and: 27.
		].
	}.
	(self base sample: possibleSegments) value.
]

{ #category : #accessing }
FakerCoordinates >> inAustralia [
	|possibleSegments|
	
	possibleSegments := {
		"Northern tip 1"
		[
			self longitudeBetween: 126 and: 136.
			self latitudeBetween: -16 and: -12.
		].
		"Northern tip 2"
		[
			self longitudeBetween: 142 and: 144.
			self latitudeBetween: -18 and: -10.
		].
		"Northern segment"
		[
			self longitudeBetween: 124 and: 146.
			self latitudeBetween: -20 and: -16.
		].
		"Central & Southern segments"
		[
			self longitudeBetween: 114 and: 154.
			self latitudeBetween: -32 and: -20.
		].
		"South-West segment"
		[
			self longitudeBetween: 116 and: 123.
			self latitudeBetween: -34.5 and: -32.
		].
		"Southern-East segment 1"
		[
			self longitudeBetween: 136 and: 150.
			self latitudeBetween: -36 and: -32.
		].
		"South-East segment 2"
		[
			self longitudeBetween: 140 and: 148.
			self latitudeBetween: -38 and: -36.
		]
	}.
	(self sample: possibleSegments) value.
]

{ #category : #accessing }
FakerCoordinates >> inEurope [
	self latitudeBetween: 35 and: 72.
	self longitudeBetween: -10 and: 50.
]

{ #category : #accessing }
FakerCoordinates >> inNorthAmerica [
	|possibleSegments|
	
	possibleSegments := {
		"Mainland US & Southern Canada"
		[
			self latitudeBetween: 30 and: 55.
			self longitudeBetween: -125 and: -70.	
		].
		"Northern Mexico"
		[
			self latitudeBetween: 25 and: 30.
			self longitudeBetween: -115 and: -97.	
		].
		"Southern Mexico"
		[
			self latitudeBetween: 17 and: 25.
			self longitudeBetween: -107 and: -97.
		]
	}.
	
	(self base sample: possibleSegments) value.
]

{ #category : #accessing }
FakerCoordinates >> inSouthAmerica [
	|possibleSegments|
	
	possibleSegments := {
		"Northern tip - above the equator"
		[
			self longitudeBetween: -80 and: -50.
			self latitudeBetween: 0 and: 12.
		].
		"Northern segment - below the equator"
		[
			self longitudeBetween: -77 and: -35.
			self latitudeBetween: -15 and: 0.
		].
		"Central segment"
		[
			self longitudeBetween: -70 and: -45.
			self latitudeBetween: -30 and: -15.
		].
		"Southern segment 1"
		[
			self longitudeBetween: -73 and: -55.
			self latitudeBetween: -40 and: -30.
		].
		"Shouthern segment 2"
		[
			self longitudeBetween: -75 and: -65.
			self latitudeBetween: -50 and: -40.
		].
	}.
	(self base sample: possibleSegments) value.
]

{ #category : #accessing }
FakerCoordinates >> latitude [
	^ latitude
]

{ #category : #accessing }
FakerCoordinates >> latitudeBetween: aNumber and: anotherNumber [
	latitude := self base random nextBetween: aNumber and: anotherNumber.
]

{ #category : #accessing }
FakerCoordinates >> longitude [
	^ longitude
]

{ #category : #accessing }
FakerCoordinates >> longitudeBetween: aNumber and: anotherNumber [
	longitude := self base random nextBetween: aNumber and: anotherNumber.
]

{ #category : #accessing }
FakerCoordinates >> randomLocation [
	self latitudeBetween: -90 and: 90.
	self longitudeBetween: -180 and: 180.
]
