accessing
owner: anAuthor add: aDidacticMaterial
	"Adds aDidacticMaterial to the internal structure. It also links that didactic material to anAuthor"
	
	| uri msg test |
	uri := aDidacticMaterial uri.
	test := items contains: uri.
	(test) ifTrue: [
		msg := 'The didactic material: *', uri, '* already exists!'.
		self error: msg
	].
	(test) ifFalse: [
		msg := 'The didactic material: *', uri, '* DOESNT exists!'.
		aDidacticMaterial owner: anAuthor.
		items add: uri -> aDidacticMaterial.
	].
	Transcript show: msg; cr.