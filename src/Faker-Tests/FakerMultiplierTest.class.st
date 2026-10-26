"
A FakerMultiplierTest is a test class for testing the behavior of FakerMultiplier
"
Class {
	#name : #FakerMultiplierTest,
	#superclass : #TestCase,
	#category : #'Faker-Tests-Modules'
}

{ #category : #tests }
FakerMultiplierTest >> testSampleOfSize [

	| mult result |
	mult := FakerMultiplier new.
	mult target: [ 1 ].
	result := mult sampleOfSize: 5.
	self assert: [ result = #( 1 1 1 1 1) ]
	description: 'The multiplier did not return the correct number of arguments'
]
