Class {
	#name : #FakerDate,
	#superclass : #FakerModule,
	#category : #'Faker-Modules'
}

{ #category : #accessing }
FakerDate >> backward: aDuration [
	<return: #DateAndTime>
	| aNow |
	aNow := DateAndTime now.
	^ self between: aNow - aDuration and: aNow
]

{ #category : #accessing }
FakerDate >> between: aFromDateAndTime and: aToDateAndTime [
	<return: #DateAndTime>
	| anFromOffset aResult |
	self 
		assert: [ aFromDateAndTime < aToDateAndTime ]
		description: [ 'Date range must be non empty and positive: from date < to date' ].
	anFromOffset := self base sample: (aToDateAndTime - aFromDateAndTime) asSeconds.
	self 
		assert: [ anFromOffset isInteger ] 
		description: [ 'Random offset number between two dates must be an integer value' ].
	aResult := aFromDateAndTime + anFromOffset asSeconds.
	self 
		assert: [ aFromDateAndTime <= aResult and: [ aResult <= aToDateAndTime ] ]
		description: [ 'Random date must fall between a range' ].
	^ aResult
]

{ #category : #accessing }
FakerDate >> forward: aDuration [
	<return: #DateAndTime>
	| aNow |
	aNow := DateAndTime now.
	^ self between: aNow and: aNow + aDuration 
]

{ #category : #accessing }
FakerDate >> sample [
	<return: #DateAndTime>
	| aFromDateAndTime aToDateAndTime aNow |
	aFromDateAndTime := self properties fromDateAndTime.
	aToDateAndTime := self properties toDateAndTime.
	(aFromDateAndTime isNotNil and: [ aToDateAndTime isNotNil ])
		ifTrue: [ ^ self between: aFromDateAndTime and: aToDateAndTime ].
	aNow := DateAndTime now.
	aFromDateAndTime isNotNil
		ifTrue: [ ^ self between: aFromDateAndTime and: aNow ].
	aToDateAndTime isNotNil
		ifTrue: [ ^ self between: aNow and: aToDateAndTime ].
	self properties backwardDuration ifNotNil: [ :aDuration | 
		^ self between: aNow - aDuration and: aNow ].
	self properties forwardDuration ifNotNil: [ :aDuration | 
		^ self between: aNow and: aNow + aDuration ].
	self error: 'Cannot generate random date without a date range defined'
]
