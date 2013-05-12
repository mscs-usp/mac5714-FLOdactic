accessing
owner: anOwner edit: aDidacticMaterial
	"Edits aDidacticMaterial."
	self validate: aDidacticMaterial.
	
	Transcript show: 'Editing: *', aDidacticMaterial uri, '*'; cr.
	aDidacticMaterial touch.
	items at: (aDidacticMaterial uri) put: aDidacticMaterial.
	