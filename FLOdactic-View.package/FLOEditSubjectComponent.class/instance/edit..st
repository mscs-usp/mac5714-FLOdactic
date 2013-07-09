as yet unclassified
edit: anItem
	super edit: anItem.
	item responsibleProfessor ifNotNil: [
		selectedProfessorUser := item responsibleProfessor username ].
	selectedDidacticMaterials := (item didacticMaterials values) asSet