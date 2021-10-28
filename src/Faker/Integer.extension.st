Extension { #name : #Integer }

{ #category : #'*Faker' }
Integer >> fakerAsPercentageRelativeTo: aSize [
	^ (((self / aSize) * 100) printShowingDecimalPlaces: 1) asString, '%'
]
