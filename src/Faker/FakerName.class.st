Class {
	#name : #FakerName,
	#superclass : #FakerModule,
	#category : #'Faker-Modules'
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
FakerName >> firstName [
	<return: #String>
	^ self locales personFirstName
]

{ #category : #accessing }
FakerName >> lastName [
	<return: #String>
	^ self locales personLastName
]
