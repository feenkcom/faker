Extension { #name : #Array }

{ #category : #'*Faker' }
Array >> fakerUniformChoice [
	|valuesWithWeights values|
	values := Array 
		new: (self size)
		withAll: (((1 / (self size))* 100) asInteger).
	valuesWithWeights := OrderedDictionary
		newFromKeys: self
		andValues: values.
	
	^ FakerChoiceSpecification new
		valuesWithWeights: valuesWithWeights.
]

{ #category : #'*Faker' }
Array >> fakerWeightedChoice [
	^ FakerChoiceSpecification new
		valuesWithWeights: self asOrderedDictionary
]

{ #category : #'*Faker' }
Array >> fakerWeightedSizeWithVariance [
	^ self fakerWeightedSizeWithVariance: 20 percent
]

{ #category : #'*Faker' }
Array >> fakerWeightedSizeWithVariance: aPercent [
	^ FakerSizeSpecification new
		valuesWithWeights: self asOrderedDictionary; 
		variance: aPercent
]
