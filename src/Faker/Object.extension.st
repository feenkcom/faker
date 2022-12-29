Extension { #name : #Object }

{ #category : #'*Faker' }
Object >> copyWithFaker: aFaker [
	"I create a copy of an object.
	I call #copyWithFaker: for every instance variable.
	See {{gtClass:FakerValue}} for more details."

	| aCopy |
	aCopy := self copy.

	aCopy class allSlots
		do: [ :aSlot | 
			| aCurrentValue aNewValue |
			aCurrentValue := aSlot read: aCopy.
			aNewValue := aCurrentValue copyWithFaker: aFaker.
			aSlot write: aNewValue to: aCopy ].

	^ aCopy
]

{ #category : #'*Faker' }
Object >> fakerValueWith: aFaker [
	^ self
]
