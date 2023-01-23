Class {
	#name : #FakerMusic,
	#superclass : #FakerModule,
	#category : #'Faker-Modules'
}

{ #category : #accessing }
FakerMusic >> album [
	"Produces the name of an album."

	<return: #String>
	^ self locales musicModule album
]

{ #category : #accessing }
FakerMusic >> band [
	"Produces the name of a band."

	<return: #String>
	^ self locales musicModule band
]

{ #category : #accessing }
FakerMusic >> chord [
	"Produces the name of a chord, using letter notation."

	<return: #String>
	^ (self key), (self sample: self chordTypes)
]

{ #category : #accessing }
FakerMusic >> chordTypes [
	"Produces an array of types of chords."

	<return: #Array of: #String>
	^ #('' 'maj' '6' 'maj7' 'm' 'm7' '-7' '7' 'dom7' 'dim' 'dim7' 'm7b5')
]

{ #category : #accessing }
FakerMusic >> genre [
	"Produces the name of a musical genre."

	<return: #String>
	^ self locales musicModule genre
]

{ #category : #accessing }
FakerMusic >> instrument [
	"Produces the name of an instrument."

	<return: #String>
	^ self locales musicModule instrument
]

{ #category : #accessing }
FakerMusic >> key [
	"Produces the name of a key/note, using letter notation."

	<return: #String>
	^ (self sample: self keys), (self sample: self keyVariants)
]

{ #category : #accessing }
FakerMusic >> keyVariants [
	"Produces an array of accidentals (with 'natural' denoted as an empty string)."

	<return: #Array of: #String>
	^ #('b' '#' '')
]

{ #category : #accessing }
FakerMusic >> keys [
	"Produces an array of the letter names of musical notes, without accidentals."

	<return: #Array of: #String>
	^ #('C' 'D' 'E' 'F' 'G' 'A' 'B')
]

{ #category : #accessing }
FakerMusic >> mamboNumberFive [
	"Produces a name from Lou Bega's Mambo #5"

	<return: #String>
	^ self locales musicModule mamboNumberFive
]
