as yet unclassified
addMaterial: aDidacticMaterial 
	"Adds a didactic material. The owner will be the logged in user"
	
	| test |
	test := self loggedInOrRaiseErrorIfNot.
	test ifTrue: [
		aDidacticMaterial touch.
		didacticMaterials owner: loggedUser add: aDidacticMaterial.
	]