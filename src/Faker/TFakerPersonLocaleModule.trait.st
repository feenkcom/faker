Trait {
	#name : 'TFakerPersonLocaleModule',
	#category : 'Faker-Locales'
}

{ #category : 'person' }
TFakerPersonLocaleModule >> personFirstName [
	<return: #String>
	^ self base sample: self personFirstNames 
]

{ #category : 'person' }
TFakerPersonLocaleModule >> personLastName [
	<return: #String>
	^ self base sample: self personLastNames 
]

{ #category : 'person' }
TFakerPersonLocaleModule >> personPrefix [
	<return: #String>
	^ self base sample: self personPrefixes 
]
