ownership and permissions
addDidacticMaterialByURI: aURI
	"Adds a didactic material to the list"
	
	| material  manager |
	manager := DidacticMaterialsManager singleton.
	
	"does it exist?"
	(manager items includesKey: aURI) ifTrue: [
		material := manager items at: aURI.
		didacticMaterials add: aURI -> material ]