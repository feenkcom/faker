Class {
	#name : #FakerIPAddress,
	#superclass : #FakerModule,
	#category : #'Faker-Modules'
}

{ #category : #accessing }
FakerIPAddress >> ipSegmentLargerThan: aNumber [
	^ self base nextIntegerBetween: aNumber and: 255
]

{ #category : #accessing }
FakerIPAddress >> sample [
	^ '.' join: {
		self ipSegmentLargerThan: 0.
		self ipSegmentLargerThan: 0.
		self ipSegmentLargerThan: 0.
		self ipSegmentLargerThan: 0.
	}
]

{ #category : #accessing }
FakerIPAddress >> sampleWithMask: aMask [
	|maskSegments|
	maskSegments := OrderedCollection new.
	('.' split: aMask) do: [ :item |
		maskSegments add: (item asInteger).
	].
	^ '.' join: {
		self ipSegmentLargerThan: (maskSegments at: 1).
		self ipSegmentLargerThan: (maskSegments at: 2).
		self ipSegmentLargerThan: (maskSegments at: 3).
		self ipSegmentLargerThan: (maskSegments at: 4).
	}
]
