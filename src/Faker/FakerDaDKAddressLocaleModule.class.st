"
Module used to generate a fake Danish-looking address
"
Class {
	#name : #FakerDaDKAddressLocaleModule,
	#superclass : #FakerDaDkLocaleModule,
	#traits : 'TFakerAddressLocaleModule',
	#classTraits : 'TFakerAddressLocaleModule classTrait',
	#category : #'Faker-Locales'
}

{ #category : #accessing }
FakerDaDKAddressLocaleModule >> address [
	^ ' ' join: {self streetName . self streetNumber}.
]

{ #category : #address }
FakerDaDKAddressLocaleModule >> composedStreetNamePrefixes [
	^ #('Vinkel' 'Birke' 'Lærke'  'Tove' 'Havn')
]

{ #category : #address }
FakerDaDKAddressLocaleModule >> composedStreetNameSuffixes [
	^ #('gade'  'torv'  'plads' 'vej')
]

{ #category : #accessing }
FakerDaDKAddressLocaleModule >> simpleToComposedStreetNamesRatio [
	^ {true -> 50 . false -> 50} asOrderedDictionary
]

{ #category : #address }
FakerDaDKAddressLocaleModule >> streetTypes [
	^ #('Gade' 'Boulevard' 'Torv' 'Plads' 'Allé' 'Vej' 'Stranden')
]
