Class {
	#name : #FakerLoremIpsum,
	#superclass : #FakerModule,
	#category : #'Faker-Modules'
}

{ #category : #accessing }
FakerLoremIpsum >> anyLength [
	^ String loremIpsum
]

{ #category : #accessing }
FakerLoremIpsum >> between: aMinLength and: aMaxLength [
	| aLength |
	aLength := self base nextIntegerBetween: aMinLength and: aMaxLength.

	^ String loremIpsum: aLength
]

{ #category : #accessing }
FakerLoremIpsum >> ofLength: aLength [
	^ String loremIpsum: aLength
]
