initialize-release
removeDidacticMaterial: aDidacticMaterial
	(self canRemove: aDidacticMaterial) ifTrue: [
		didacticMaterials remove: aDidacticMaterial.
	].