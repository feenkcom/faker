Class {
	#name : #FakerCoordinates,
	#superclass : #FakerModule,
	#instVars : [
		'longitude',
		'latitude'
	],
	#category : #'Faker-Modules'
}

{ #category : #constructor }
FakerCoordinates class >> inAfrica [
	^ self new
		base: (Faker new);
		inAfrica.
]

{ #category : #constructor }
FakerCoordinates class >> inAsia [
	^ self new
		base: (Faker new);
		inAsia.
]

{ #category : #constructor }
FakerCoordinates class >> inAustralia [
	^ self new
		base: (Faker new);
		inAustralia.
]

{ #category : #constructor }
FakerCoordinates class >> inEurope [
	^ self new 
		base: (Faker new);
		inEurope
]

{ #category : #constructor }
FakerCoordinates class >> inNorthAmerica [
	^ self new
		base: (Faker new);
		inNorthAmerica.
]

{ #category : #constructor }
FakerCoordinates class >> inSouthAmerica [
	^ self new
		base: (Faker new);
		inSouthAmerica.
]

{ #category : #constructor }
FakerCoordinates class >> randomLocation [
	^ self new 
		base: (Faker new);
		randomLocation
]

{ #category : #accessing }
FakerCoordinates >> absoluteDistanceTo: anObject [
	^ (
		(self longitude - anObject longitude) squared + 
		(self latitude - anObject latitude) squared
	) sqrt.
]

{ #category : #generate }
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

{ #category : #generate }
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

{ #category : #generate }
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

{ #category : #generate }
FakerCoordinates >> inEurope [
	self latitudeBetween: 35 and: 72.
	self longitudeBetween: -10 and: 50.
]

{ #category : #generate }
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

{ #category : #generate }
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
FakerCoordinates >> latitude: aFloat [
	self assert: (aFloat >= -90 and: [aFloat <= 90]).
	latitude := aFloat.
]

{ #category : #utils }
FakerCoordinates >> latitudeBetween: aNumber and: anotherNumber [
	latitude := self base random nextBetween: aNumber and: anotherNumber.
]

{ #category : #accessing }
FakerCoordinates >> longitude [
	^ longitude
]

{ #category : #accessing }
FakerCoordinates >> longitude: aFloat [
	self assert: (aFloat >= -180 and: [aFloat <= 180]).
	longitude := aFloat.
]

{ #category : #utils }
FakerCoordinates >> longitudeBetween: aNumber and: anotherNumber [
	longitude := self base random nextBetween: aNumber and: anotherNumber.
]

{ #category : #editing }
FakerCoordinates >> moveWithVariance: aFloat [
	|latitudeError longitudeError|

	latitudeError := self base random nextBetween: (-1 * aFloat) and: aFloat.
	longitudeError := self base random nextBetween: (-1 * aFloat) and: (aFloat).
	
	(latitude + latitudeError < -90 or: [latitude + latitudeError > 90]) 
		ifTrue: [latitudeError := latitudeError * -1].
	(longitude + longitudeError < -180 or: [longitude + longitudeError > 180]) 
		ifTrue: [latitudeError := longitudeError * -1].
	
    latitude := latitude + latitudeError.
	longitude := longitude + longitudeError.
]

{ #category : #accessing }
FakerCoordinates >> newCoordinatesMovedWithVariance: aFloat [
	^ FakerCoordinates 
		new
		base: (self base);
		longitude: (self longitude);
		latitude: (self latitude);
		moveWithVariance: aFloat.
]

{ #category : #generate }
FakerCoordinates >> randomLocation [
	|blockToRun|
	
	blockToRun := self base sampleWithWeights: {
		[self inEurope] -> 32.
		[self inNorthAmerica] ->16.
		[self inAsia] -> 16.
		[self inSouthAmerica] -> 8.
		[self inAfrica] -> 8.
		[self inAustralia] -> 4. 
	} asOrderedDictionary.
	
	blockToRun value.
]
