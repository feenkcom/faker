Class {
	#name : #FakerCompany,
	#superclass : #FakerModule,
	#category : 'Faker-Modules'
}

{ #category : #accessing }
FakerCompany >> name [
	<return: #String>
	^ self locales companyModule companyName
]

{ #category : #accessing }
FakerCompany >> suffix [
	<return: #String>
	^ self locales companyModule companySuffix
]
