accessing
toggleMaterialStatus: aMaterial
	self loggedInOrRaiseErrorIfNot.
	
	( self canEnable: aMaterial ) ifFalse: [
		PermissionError signal: 'You do not have permission to enable this.' ].

	didacticMaterials toggleEnable: aMaterial.
