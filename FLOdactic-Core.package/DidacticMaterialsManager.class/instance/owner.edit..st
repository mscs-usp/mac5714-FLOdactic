accessing
owner: anOwner edit: aDidacticMaterial
	"Edits aDidacticMaterial."
	| material |
	(items includesKey: aDidacticMaterial uri) ifFalse: [
		ValidationError signal: 'The material you are trying to update does not exist' ].
	
	self validate: aDidacticMaterial forExistingKey: aDidacticMaterial uri.
	
	material := items at: aDidacticMaterial uri.
	material copyFrom: aDidacticMaterial.

	Transcript show: 'Editing: *', aDidacticMaterial uri, '*'; cr.
	aDidacticMaterial touch.
	