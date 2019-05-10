Class {
	#name : #FakerInternet,
	#superclass : #FakerModule,
	#category : #'Faker-Modules'
}

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
