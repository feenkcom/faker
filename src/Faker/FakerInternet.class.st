Class {
	#name : #FakerInternet,
	#superclass : #Object,
	#instVars : [
		'base'
	],
	#category : #'Faker-Internet'
}

{ #category : #accessing }
FakerInternet >> base [
	^ base
]

{ #category : #accessing }
FakerInternet >> base: anObject [
	base := anObject
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
			self base prepareString: self base familyName }.
	} 
	
]
