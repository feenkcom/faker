"
Module used to generate a fake German-looking address
"
Class {
	#name : #FakerDeAddressLocaleModule,
	#superclass : #FakerDeLocaleModule,
	#traits : 'TFakerAddressLocaleModule',
	#classTraits : 'TFakerAddressLocaleModule classTrait',
	#category : #'Faker-Locales'
}

{ #category : #accessing }
FakerDeAddressLocaleModule >> address [
	^ ' ' join: {self streetName . self streetNumber}
]

{ #category : #address }
FakerDeAddressLocaleModule >> composedStreetNamePrefixes [
	^ #('Haupt' 'Schul' 'Dorf' 'Garten' 'Bahnhof' 'Schiller' 'Goethe' 'Jahn' 'Mozart' 'Raiffeisen' 'Beethoven' 'Haydn' 'Linden').
]

{ #category : #address }
FakerDeAddressLocaleModule >> composedStreetNameSuffixes [
	^ #('platz' 'straße')
]

{ #category : #address }
FakerDeAddressLocaleModule >> simpleToComposedStreetNamesRatio [
	^ {true -> 50 . false -> 50} asOrderedDictionary
]

{ #category : #address }
FakerDeAddressLocaleModule >> streetTypes [
	^ #('Prachtstraße' 'Platz' 'Straße' 'Straße')
]
