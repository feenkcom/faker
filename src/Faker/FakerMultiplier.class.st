Class {
	#name : #FakerMultiplier,
	#superclass : #FakerOperationModule,
	#instVars : [
		'targetComputation'
	],
	#category : #'Faker-Modules'
}

{ #category : #api }
FakerMultiplier >> sampleOfSize: aSize [
	^ aSize timesCollect: [ 
		targetComputation value ]
]

{ #category : #accessing }
FakerMultiplier >> target: aBlock [
	targetComputation := aBlock
]

{ #category : #api }
FakerMultiplier >> uniqueSampleOfSize: aSize [
	| currentSamples  |
	currentSamples := OrderedCollection new: aSize.
	
	[ currentSamples size < aSize ] whileTrue: [ 
		| newSample |
		newSample := targetComputation value.
		(currentSamples includes: newSample)
			ifFalse: [ currentSamples add: newSample ] ].
	^ currentSamples
]
