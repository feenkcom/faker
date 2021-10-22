Extension { #name : #Array }

{ #category : #'*Faker' }
Array >> fakerWeightedSizeWithVariance: aPercent [
	^ FakerSizeSpecification new
		sizesWithWeights: self asDictionary; 
		variance: aPercent
]
