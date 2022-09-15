Class {
	#name : #FakerEnAddressLocaleModule,
	#superclass : #FakerEnLocaleModule,
	#traits : 'TFakerAddressLocaleModule',
	#classTraits : 'TFakerAddressLocaleModule classTrait',
	#category : #'Faker-Locales'
}

{ #category : #accessing }
FakerEnAddressLocaleModule >> address [
	^ ' ' join: {self streetNumber . self streetName}.
]

{ #category : #address }
FakerEnAddressLocaleModule >> composedStreetNamePrefixes [
	^ nil.
]

{ #category : #address }
FakerEnAddressLocaleModule >> composedStreetNameSuffixes [
	^ nil.
]

{ #category : #address }
FakerEnAddressLocaleModule >> simpleToComposedStreetNamesRatio [
	^ {true  -> 100 . false -> 0} asOrderedDictionary.
]

{ #category : #address }
FakerEnAddressLocaleModule >> streetTypes [
	^ #('Alley' 'Street' 'Boulevard' 'Way' 'Square')
]
