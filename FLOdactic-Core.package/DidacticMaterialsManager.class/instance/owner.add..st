accessing
<<<<<<< HEAD
owner: aUserOwner add: aDidacticMaterial
=======
owner: anOwner add: aDidacticMaterial
>>>>>>> 9ef15e00f7b798a55c5b24401f9310bddfc20a5b
	"Adds aDidacticMaterial to the internal structure. It also links that didactic material to anAuthor"
	|msg|
	
<<<<<<< HEAD
	self validate: aDidacticMaterial.

	aDidacticMaterial owner: aUserOwner.
	items add: aDidacticMaterial uri -> aDidacticMaterial.

	msg := 'The didactic material: *', aDidacticMaterial uri, '* DOESNT exists! Creating...'.
=======
	| uri msg test |
	uri := aDidacticMaterial uri.
	test := items includes: uri.
	(test) ifTrue: [
		msg := 'The didactic material: *', uri, '* already exists!'.
		self error: msg
	].
	(test) ifFalse: [
		msg := 'The didactic material: *', uri, '* DOESNT exists!'.
		aDidacticMaterial owner: anOwner.
		items add: uri -> aDidacticMaterial.
	].
>>>>>>> 9ef15e00f7b798a55c5b24401f9310bddfc20a5b
	Transcript show: msg; cr.