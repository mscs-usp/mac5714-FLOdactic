accessing
owner: anAuthor add: aDidacticMaterial
	"Adds aDidacticMaterial to the internal structure. It also links that didactic material to anAuthor"
	|msg|
	
	self validate: aDidacticMaterial.

	aDidacticMaterial owner: anAuthor.
	items add: aDidacticMaterial uri -> aDidacticMaterial.

	msg := 'The didactic material: *', aDidacticMaterial uri, '* DOESNT exists! Creating...'.
	Transcript show: msg; cr.