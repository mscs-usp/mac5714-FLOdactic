as yet unclassified
initialize
	super initialize.
	didacticMaterialsManager := DidacticMaterialsManager singleton.
	didacticMaterials := didacticMaterialsManager items.
	searchResults := nil.