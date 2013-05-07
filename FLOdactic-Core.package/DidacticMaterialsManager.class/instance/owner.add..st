accessing
owner: anOwner add: aDidacticMaterial
	"Adds aDidacticMaterial to the internal structure. It also links that didactic material to anAuthor"
	
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
	Transcript show: msg; cr.