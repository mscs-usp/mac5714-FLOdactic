as yet unclassified
initialize

	users := UsersManager singleton.
	didacticMaterials := DidacticMaterialsManager singleton.
	tags := TagsManager singleton.
	
	search := SearchEngine new.
	
	Transcript show: 'Creating users interface...'; crlf.
	^ self