as yet unclassified
removeDidacticMaterial: aDidacticMaterial
	(self canRemove: aDidacticMaterial) ifTrue: [
		didacticMaterials remove: aDidacticMaterial.
	].