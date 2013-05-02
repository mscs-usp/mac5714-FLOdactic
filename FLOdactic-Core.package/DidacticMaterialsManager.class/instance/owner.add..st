accessing
owner: anAuthor add: aDidacticMaterial
	
	| uri msg |
	uri := (aDidacticMaterial uri).
	(items contains: (uri)) ifTrue: [
		msg := 'The didactic material: *', uri, '* already exists!'.
		Transcript show: msg; cr.
		self error: msg
	].
	(items contains: uri) ifFalse: [
		msg := 'The didactic material: *', uri, '* DOESNT exists!'.
		msg := 'The didactic material: *', uri, '* DOESNT exists!'.
		Transcript show: msg; cr.
		items add: uri -> aDidacticMaterial.
	].