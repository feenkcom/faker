Class {
	#name : 'FakerCountry',
	#superclass : 'FakerModule',
	#category : 'Faker-Modules'
}

{ #category : 'accessing' }
FakerCountry >> all [
	<return: #Array of: #String>
	^ self locales countryNamesAndIsoCodes
]

{ #category : 'accessing' }
FakerCountry >> isoCode [
	<return: #String>
	^ self locales countryIsoCode
]

{ #category : 'accessing' }
FakerCountry >> name [
	<return: #String>
	^ self locales countryName
]

{ #category : 'accessing' }
FakerCountry >> nameAndIsoCode [
	<return: #Array of: #String>
	^ self locales countryNameAndIsoCode
]
