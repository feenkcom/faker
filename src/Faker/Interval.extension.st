Extension { #name : #Interval }

{ #category : #'*Faker' }
Interval >> fakerScaledValue [
	^ FakerInBetweenIntegerSpecification new
		lowerBound: self first;
		higherBound: self last;
		useScale: true
]
