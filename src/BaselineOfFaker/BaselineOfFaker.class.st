Class {
	#name : #BaselineOfFaker,
	#superclass : #BaselineOf,
	#category : #BaselineOfFaker
}

{ #category : #baselines }
BaselineOfFaker >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		spec 
			package: 'Faker'
	]

]
