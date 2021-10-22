Class {
	#name : #FakerProperties,
	#superclass : #FakerPropertiesModule,
	#category : #'Faker-Properties'
}

{ #category : #date }
FakerProperties >> backwardDuration [
	<return: #Duration or: nil>
	^ self 
		at: #backwardDuration 
		ifAbsent: [ nil ]
]

{ #category : #date }
FakerProperties >> backwardDuration: aDuration [
	^ self 
		at: #backwardDuration 
		put: aDuration
]

{ #category : #date }
FakerProperties >> forwardDuration [
	<return: #Duration or: nil>
	^ self 
		at: #forwardDuration 
		ifAbsent: [ nil ]
]

{ #category : #date }
FakerProperties >> forwardDuration: aDuration [
	^ self 
		at: #forwardDuration 
		put: aDuration
]

{ #category : #date }
FakerProperties >> fromDateAndTime [
	<return: #DateAndTime or: nil>
	^ self 
		at: #fromDateAndTime 
		ifAbsent: [ nil ]
]

{ #category : #date }
FakerProperties >> fromDateAndTime: aDateAndTime [
	^ self 
		at: #fromDateAndTime 
		put: aDateAndTime
]

{ #category : #date }
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

{ #category : #date }
FakerProperties >> toDateAndTime [
	<return: #DateAndTime or: nil>
	^ self 
		at: #toDateAndTime 
		ifAbsent: [ nil ]
]

{ #category : #date }
FakerProperties >> toDateAndTime: aDateAndTime [
	^ self 
		at: #toDateAndTime 
		put: aDateAndTime
]
