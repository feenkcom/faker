Trait {
	#name : #TFakerCompanyLocaleModule,
	#category : 'Faker-Locales'
}

{ #category : #company }
TFakerCompanyLocaleModule >> companyName [
	^ (self sample: self companyNames) value
]

{ #category : #company }
TFakerCompanyLocaleModule >> companySuffix [
	^ self sample: self companySuffixes
]
