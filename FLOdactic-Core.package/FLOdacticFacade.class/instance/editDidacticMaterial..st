as yet unclassified
editDidacticMaterial: aDidacticMaterial 
	"Edit a didactic material. The owner must match the logged in user"
	
	| test |
	test := self loggedInOrRaiseErrorIfNot.
	test ifTrue: [
		test := aDidacticMaterial owner ~= nil. "if it already exists..."
		test ifTrue: [
			test := loggedUser username ~= nil.
			test ifTrue: [
				test := self canEdit: aDidacticMaterial.
				test ifTrue: [
					didacticMaterials owner: loggedUser edit: aDidacticMaterial.
				]
			]
		]
	]