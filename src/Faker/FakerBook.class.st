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

{ #category : #private }
FakerBook >> calculateCheckdigit: raw_isbn [
	| aCheckDigit aReminder |
	aCheckDigit := 0.
	raw_isbn
		withIndexDo: [ :aCharacter :anIndex | 
			| aDigit |
			aDigit := aCharacter asInteger.

			(anIndex % 2) isZero
				ifTrue: [ aCheckDigit := aCheckDigit + (aDigit * 3) ]
				ifFalse: [ aCheckDigit := aCheckDigit + aDigit ] ].

	aReminder := aCheckDigit % 10.
	aReminder isZero ifTrue: [ aCheckDigit := 0 ] ifFalse: [ aCheckDigit := 10 - aReminder ].

	^ aCheckDigit asString
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
FakerBook >> isbn [
	<return: #String>
	^ self isbn10
]

{ #category : #accessing }
FakerBook >> isbn10 [
	<return: #String>
	| aRegistrationGroupElement aRegistrantElement aPublicationElement anIsbnWithoutChecksum |
	aRegistrationGroupElement := 10 atRandom asString.
	aRegistrantElement := (90000 atRandom + 10000) asString.
	aPublicationElement := (900 atRandom + 100) asString.
	anIsbnWithoutChecksum := aRegistrationGroupElement , aRegistrantElement
		, aPublicationElement.
	^ anIsbnWithoutChecksum , (self calculateCheckdigit: anIsbnWithoutChecksum)
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
