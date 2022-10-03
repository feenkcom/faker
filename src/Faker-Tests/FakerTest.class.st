"
A FakerTest is a test class for testing the behavior of Faker
"
Class {
	#name : #FakerTest,
	#superclass : #TestCase,
	#category : #'Faker-Tests-Core'
}

{ #category : #tests }
FakerTest >> testSampleOfSize [

	| faker sample |
	faker := Faker new.
	sample := faker sample: #( 1 2 3 4 5 ) ofSize: 3.

	self
		assert: [ sample size = 3 ]
		description: 'Sample produced was not of the required size'.


	self
		assert: [ (faker sample: #( 1 2 3 4 5 ) ofSize: 10) size = 10 ]
		description:
		'We couldnt create a collection bigger than the sample provided'
]

{ #category : #tests }
FakerTest >> testSampleOfSizeWithCumulativeWeights [
	| result | 
	result := Faker new sample: #( 1 2 3 4) ofSize: 3 withCumulativeWeights: #(1 2 3).
	self assert: [ result size = 3 ]
	description: 'We saw a result produced that is not the size requested'
]

{ #category : #tests }
FakerTest >> testUniqueSampleOfSize [

	| faker sample |
	faker := Faker new.
	sample := faker uniqueSample: #( 1 2 3 4 5 ) ofSize: 3.

	self
		assert: [ sample size = 3 ]
		description: 'Sample produced was not of the required size'.

	self
		assert: [ (Set newFrom: sample) size = sample size ]
		description: 'The sample contained non-unique items'.

	self
		should: [ faker uniqueSample: #( 1 2 3 4 5 ) ofSize: 10 ]
		raise: Error
		description:
		'This should error when the requested size is greater than the size of the sample'
]
