Class {
	#name : #FakerProperties,
	#superclass : #FakerPropertiesModule,
	#category : #'Faker-Properties'
}

{ #category : #accessing }
FakerProperties class >> itself [
	<gtExample>
	<noTest>
	^ self
]

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

{ #category : #'api - configuration' }
FakerProperties >> isDateRangeDefined [
	<return: #Boolean>
	^ self fromDateAndTime isNotNil or: [ 
		self toDateAndTime isNotNil or: [ 
			self backwardDuration isNotNil or: [ 
				self forwardDuration isNotNil ] ] ]
]

{ #category : #'accessing - properties date' }
FakerProperties >> openaiApiKey [
	<return: #String or: nil>
	^ self at: #openaiApiKey ifAbsent: [ nil ]
]

{ #category : #'api - configuration' }
FakerProperties >> openaiApiKey: aKey [
	self at: #openaiApiKey put: aKey
]

{ #category : #'accessing - properties date' }
FakerProperties >> openaiImageCount [
	<return: #String>
	^ self at: #openaiImageCount ifAbsent: [ 1 ]
]

{ #category : #'api - configuration' }
FakerProperties >> openaiImageCount: aCount [
	self at: #openaiImageCount put: aCount
]

{ #category : #'accessing - properties date' }
FakerProperties >> openaiImagePrompt [
	<return: #String>
	^ self at: #openaiImagePrompt ifAbsent: [ 'random image' ]
]

{ #category : #'api - configuration' }
FakerProperties >> openaiImagePrompt: aPrompt [
	self at: #openaiImagePrompt put: aPrompt
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

{ #category : #'accessing - properties date' }
FakerProperties >> unsplashAccessKey [
	<return: #String or: nil>
	^ self at: #unsplashAccessKey ifAbsent: [ nil ]
]

{ #category : #'api - configuration' }
FakerProperties >> unsplashAccessKey: aKey [
	self at: #unsplashAccessKey put: aKey
]

{ #category : #'accessing - properties date' }
FakerProperties >> unsplashCount [
	<return: #Integer or: nil>
	^ self at: #unsplashCount ifAbsent: [ nil ]
]

{ #category : #'accessing - properties date' }
FakerProperties >> unsplashQuery [
	<return: #String or: nil>
	^ self at: #unsplashQuery ifAbsent: [ nil ]
]

{ #category : #'api - configuration' }
FakerProperties >> unsplashQuery: aQuery [
	self at: #unsplashQuery put: aQuery
]
