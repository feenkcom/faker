Extension { #name : #Collection }

{ #category : #'*Faker' }
Collection >> copyWithFaker: aFaker [
	^ self collect: [ :aValue | aValue copyWithFaker: aFaker ]
]
