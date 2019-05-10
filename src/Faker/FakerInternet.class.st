Class {
	#name : #FakerInternet,
	#superclass : #FakerModule,
	#category : #'Faker-Modules'
}

{ #category : #actions }
FakerInternet >> domainSuffix [
	"Return a random domain suffix"
	<return: #String>
	^ self base sample: self base locales domainSuffixes
]

{ #category : #accessing }
FakerInternet >> domainWord [
	"Return a company domain name"
	<return: #String>
	| aName |
	aName := String space split: self base company name.
	^ self base prepareString: aName
]

{ #category : #actions }
FakerInternet >> username [
	<return: #String>
	^ self usernameWithSeparators: '._'
]

{ #category : #actions }
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
