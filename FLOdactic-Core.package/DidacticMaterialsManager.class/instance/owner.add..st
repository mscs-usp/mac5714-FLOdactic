accessing
owner: anOwner add: aDidacticMaterial
	"Adds aDidacticMaterial to the internal structure. It also links that didactic material to anAuthor"
	self validate: aDidacticMaterial.
	
	Transcript show: 'The didactic material: *', aDidacticMaterial uri, '* DOESNT exists!'; cr.
	aDidacticMaterial owner: anOwner.
	aDidacticMaterial doEnable.
	aDidacticMaterial touch.
	items add: aDidacticMaterial uri -> aDidacticMaterial.
	