Class {
	#name : #FakerName,
	#superclass : #Object,
	#instVars : [
		'base',
		'firstNames',
		'familyNames'
	],
	#category : #'Faker-Base'
}

{ #category : #names }
FakerName class >> englishBoyCommonNames [
	<gtExample>
	^ 'Oliver
Jack
Harry
Jacob
Charlie
Thomas
George
Oscar
James
William
Jake
Connor
Callum
Jacob
Kyle
Joe
Reece
Rhys
Charlie
Damian
Noah
Liam
Mason
Jacob
William
Ethan
Michael
Alexander
James
Daniel
James
John
Robert
Michael
William
David
Richard
Joseph
Charles
Thomas
' lines
]

{ #category : #names }
FakerName class >> englishCommonFamilyNames [
	<gtExample>
	^ 'Smith
Jones
Williams
Brown
Taylor
Davies
Wilson
Evans
Thomas
Roberts
Murphy
O''Kelly
O''Sullivan
Walsh
Smith
O''Brien
Byrne
O''Ryan
O''Connor
O''Neill
Smith
Johnson
Williams
Brown
Jones
Miller
Davis
Garcia
Rodriguez
Wilson
Li
Smith
Lam
Martin
Gelbero
Roy
Tremblay
Lee
Gagnon
Wilson
Smith
Jones
Williams
Brown
Wilson
Taylor
Morton
White
Martin
Anderson
Smith
Wilson
Williams
Brown
Taylor
Jones
Singh
Wang
Anderson
Li' lines
]

{ #category : #names }
FakerName class >> englishCommonFirstNames [
	<gtExample>
	^ self englishBoyCommonNames, self englishGirlCommonNames
]

{ #category : #names }
FakerName class >> englishGirlCommonNames [
	<gtExample>
	^ 'Amelia
Olivia
Isla
Emilyh
Poppy
Ava
Isabella
Jessica
Lily
Sophie
Mary
Patricia
Jennifer
Elizabet
Linda
Barbara
Susan
Margaret
Jessica
Sarah
Emma
Olivia
Sophia
Isabella
Ava
Mia
Emily
Abigail
Madison
Charlotte
Margaret
Samantha
Bethany
Elizabeth
Joanne
Megan
Victoria
Lauren
Michelle
Tracy' lines 
]

{ #category : #accessing }
FakerName >> base [
	<return: #FakerBase>
	^ base
]

{ #category : #accessing }
FakerName >> base: anObject [
	base := anObject
]

{ #category : #accessing }
FakerName >> familyName [
	<return: #String>
	^ self base sample: self familyNames
]

{ #category : #accessing }
FakerName >> familyNames [
	<return: #Array of: #String>
	^ familyNames ifNil: [ familyNames := self class englishCommonFamilyNames ]
]

{ #category : #accessing }
FakerName >> firstName [
	<return: #String>
	^ self base sample: self firstNames
]

{ #category : #accessing }
FakerName >> firstNames [
	<return: #Array of: #String>
	^ firstNames ifNil: [ firstNames := self class englishCommonFirstNames ]
]
