as yet unclassified
removeDidacticMaterial: aDidacticMaterial
	| anUriString |
	anUriString := aDidacticMaterial uri.
	(didacticMaterials includesKey: anUriString) ifTrue: [ | item |
		item := didacticMaterials at: anUriString.
		didacticMaterials removeKey: anUriString.
	].