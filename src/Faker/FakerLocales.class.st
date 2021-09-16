"
de
	^ FakerDeLocales uniqueInstance

"
Class {
	#name : 'FakerLocales',
	#superclass : 'FakerModule',
	#category : 'Faker-Locales'
}

{ #category : 'public' }
FakerLocales class >> de [
	^ FakerDeLocales new
]

{ #category : 'public' }
FakerLocales class >> default [
	^ self en
]

{ #category : 'public' }
FakerLocales class >> en [
	^ FakerEnLocales new
]

{ #category : 'country' }
FakerLocales >> countryIsoCode [
	<return: #String>
	^ self countryNamesAndIsoCode second
]

{ #category : 'country' }
FakerLocales >> countryName [
	<return: #String>
	^ self countryNamesAndIsoCode first
]

{ #category : 'country' }
FakerLocales >> countryNamesAndIsoCode [
	<return: #Array of: #String>
	^ self sample: self countryNamesAndIsoCodes
]

{ #category : 'country' }
FakerLocales >> countryNamesAndIsoCodes [
	^ FakerEnLocales new countryNamesAndIsoCodes
]
