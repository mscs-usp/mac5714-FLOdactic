as yet unclassified
save
	item didacticMaterials keysDo: [ :key | item didacticMaterials removeKey: key ].
	selectedDidacticMaterials do: [ :mat |
		item addDidacticMaterialByURI: mat uri ].
	item responsibleProfessorByUsername: selectedProfessorUser.
	
	super save