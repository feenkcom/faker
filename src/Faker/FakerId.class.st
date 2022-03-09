Class {
	#name : #FakerId,
	#superclass : #FakerModule,
	#category : #'Faker-Modules'
}

{ #category : #accessing }
FakerId >> alphaNumbericStringOfSize: aSize [
	|availableChars|
	
	availableChars := Character alphabet, (Character alphabet asUppercase), '0123456789'.
	
	^ String streamContents: [:aStream | 
		aSize timesRepeat: [
			aStream 
				nextPut: (self base sample: availableChars)
		].
	].
]

{ #category : #accessing }
FakerId >> numericStringOfSize: aSize [
	^ String streamContents: [ :aStream |
		aStream 
			nextPut: (self base sample: '123456789').
		(aSize - 1) timesRepeat: [ 
			aStream 
				nextPut: (self base sample: '0123456789') ] ]
]
