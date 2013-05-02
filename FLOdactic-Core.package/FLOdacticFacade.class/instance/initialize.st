as yet unclassified
initialize

	users := UsersManager singleton.
	didacticMaterials := DidacticMaterialsManager singleton.
	tags := TagsManager singleton.
	Transcript show: 'Creating users interface...'; crlf.
	^ self