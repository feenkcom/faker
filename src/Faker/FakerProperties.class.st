Class {
	#name : #FakerProperties,
	#superclass : #FakerPropertiesModule,
	#category : #'Faker-Properties'
}

{ #category : #'accessing - properties date' }
FakerProperties >> backwardDuration [
	<return: #Duration or: nil>
	^ self 
		at: #backwardDuration 
		ifAbsent: [ nil ]
]

{ #category : #'api - configuration' }
FakerProperties >> backwardDuration: aDuration [
	^ self 
		at: #backwardDuration 
		put: aDuration
]

{ #category : #'accessing - properties date' }
FakerProperties >> forwardDuration [
	<return: #Duration or: nil>
	^ self 
		at: #forwardDuration 
		ifAbsent: [ nil ]
]

{ #category : #'api - configuration' }
FakerProperties >> forwardDuration: aDuration [
	^ self 
		at: #forwardDuration 
		put: aDuration
]

{ #category : #'accessing - properties date' }
FakerProperties >> fromDateAndTime [
	<return: #DateAndTime or: nil>
	^ self 
		at: #fromDateAndTime 
		ifAbsent: [ nil ]
]

{ #category : #'api - configuration' }
FakerProperties >> fromDateAndTime: aDateAndTime [
	^ self 
		at: #fromDateAndTime 
		put: aDateAndTime
]

{ #category : #accessing }
FakerProperties >> googleProperties [
	^ modulesDictionary
		at: #googleModule
		ifAbsent: [
			self googleProperties: SoGoogleFakerProperties new.
		]
]

{ #category : #accessing }
FakerProperties >> googleProperties: googleProperties [
	self rawBase ifNotNil: [ :aBase |
		googleProperties base: aBase ].
	^ modulesDictionary 
		at: #googleModule 
		put: googleProperties
]

{ #category : #'api - configuration' }
FakerProperties >> isDateRangeDefined [
	<return: #Boolean>
	^ self fromDateAndTime isNotNil or: [ 
		self toDateAndTime isNotNil or: [ 
			self backwardDuration isNotNil or: [ 
				self forwardDuration isNotNil ] ] ]
]

{ #category : #accessing }
FakerProperties >> scaleFactor [ 
	^ self 
		at: #scaleFactor 
		ifAbsent: [ 1 ]
]

{ #category : #accessing }
FakerProperties >> scaleFactor: anInteger [
	^ self 
		at: #scaleFactor 
		put: anInteger
]

{ #category : #'accessing - properties date' }
FakerProperties >> toDateAndTime [
	<return: #DateAndTime or: nil>
	^ self 
		at: #toDateAndTime 
		ifAbsent: [ nil ]
]

{ #category : #'api - configuration' }
FakerProperties >> toDateAndTime: aDateAndTime [
	^ self 
		at: #toDateAndTime 
		put: aDateAndTime
]
