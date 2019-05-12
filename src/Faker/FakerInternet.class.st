Class {
	#name : #FakerInternet,
	#superclass : #FakerModule,
	#category : #'Faker-Modules'
}

{ #category : #cookie }
FakerInternet >> cookieCreationDate [
	<return: #DateAndTime>
	self properties isDateRangeDefined
		ifFalse: [ ^ self base date backward: 2 years ].
	^ self base date sample
]

{ #category : #cookie }
FakerInternet >> cookieExpiryTime [
	<return: #DateAndTime>
	self properties isDateRangeDefined
		ifFalse: [ ^ self base date forward: 6 years ].
	^ self base date sample
]

{ #category : #cookie }
FakerInternet >> cookieName [
	<return: #String>
	^ self locales internetCookieName
]

{ #category : #cookie }
FakerInternet >> cookieValue [
	<return: #String>
	^ self locales internetCookieValue 
]

{ #category : #domain }
FakerInternet >> domainName [
	^ self domainNameWithSubdomain: false
]

{ #category : #domain }
FakerInternet >> domainNameWithSubdomain: aBoolean [
	| theNames |
	theNames := OrderedCollection new: 3.
	aBoolean ifTrue: [ theNames add: (self base prepareString: self domainWord) ].
	theNames add: (self base prepareString: self domainWord).
	theNames add: self domainSuffix.
	^ $. join: theNames
]

{ #category : #domain }
FakerInternet >> domainSuffix [
	"Return a random domain suffix"
	<return: #String>
	^ self locales internetDomainSuffix
]

{ #category : #domain }
FakerInternet >> domainWord [
	"Return a company domain name"
	<return: #String>
	| aName |
	aName := String space split: self base company name.
	^ self base prepareString: aName first
]

{ #category : #address }
FakerInternet >> url [
	<return: #String>
	^ self 
		urlScheme: 'https' 
		host: self domainName 
		path: ((self sample: (0 to: 6)) timesCollect: [ self username ])
]

{ #category : #address }
FakerInternet >> urlScheme: aSchemeName host: aHostName path: aPathSegments [
	<return: #String>
	self
		assert: [ aSchemeName isString ]
		description: [ 'URL scheme must be a string or symbol' ].
	self 
		assert: [ aHostName isString ]
		description: [ 'URL host must be a string' ].
	self 
		assert: [ aPathSegments isCollection ]
		description: [ 'URL path must be a collection of strings' ].
	^ (ZnUrl new 
		scheme: aSchemeName;
		host: aHostName;
		addPathSegments: aPathSegments) asString
		
]

{ #category : #user }
FakerInternet >> username [
	<return: #String>
	^ self usernameWithSeparators: '._'
]

{ #category : #user }
FakerInternet >> usernameWithSeparators: aCollection [
	<return: #String>
	^ self base sample: { 
		"first name only"
		self base prepareString: self base firstName.
		"first name and family name"
		aCollection atRandom join: { 
			self base prepareString: self base firstName.
			self base prepareString: self base lastName }.
	} 
	
]
