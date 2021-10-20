Class {
	#name : #FakerSize,
	#superclass : #FakerModule,
	#category : #'Faker-Modules'
}

{ #category : #generation }
FakerSize >> sample: aCollectionOfSizes withWeights: aCollectionOfWeights andVariance: aPercent [
	| startValue minSize |
	startValue := self base 
		sample: aCollectionOfSizes 
		withWeights: aCollectionOfWeights.
	minSize := aCollectionOfSizes min.
	^ self base random
		nextIntegerBetween: ((startValue - (startValue * aPercent ) asInteger) max: minSize)
		and: startValue + (startValue * aPercent ) asInteger
]
