Class {
	#name : #FakerId,
	#superclass : #FakerModule,
	#category : #'Faker-Modules'
}

{ #category : #accessing }
FakerId >> numericStringOfSize: aSize [
	^ String streamContents: [ :aStream |
		aStream 
			nextPut: (self base sample: '123456789').
		(aSize - 1) timesRepeat: [ 
			aStream 
				nextPut: (self base sample: '0123456789') ] ]
]
