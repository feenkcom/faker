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
FakerLoremIpsum >> ofLength: aLength [
	^ String loremIpsum: aLength
]
