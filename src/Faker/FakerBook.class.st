Class {
	#name : #FakerBook,
	#superclass : #FakerModule,
	#category : #'Faker-Modules'
}

{ #category : #accessing }
FakerBook >> author [
	<return: #String>
	^ self locales bookModule author
]

{ #category : #accessing }
FakerBook >> cover [
	<return: #String>
	^ self locales bookModule cover
]

{ #category : #accessing }
FakerBook >> genre [
	<return: #String>
	^ self locales bookModule genre
]

{ #category : #accessing }
FakerBook >> publisher [
	<return: #String>
	^ self locales bookModule publisher
]

{ #category : #accessing }
FakerBook >> title [
	<return: #String>
	^ self locales bookModule title
]
