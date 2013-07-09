accessing
editDidacticMaterial: aDidacticMaterial 
	"Edit a didactic material. The owner must match the logged in user"

	self loggedInOrRaiseErrorIfNot.
	
	( self canEdit: aDidacticMaterial ) ifFalse: [
		PermissionError signal: 'You do not have permission to update this didactic material.' ].

	didacticMaterials owner: loggedUser edit: aDidacticMaterial.
