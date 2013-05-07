accessing
validate: aDidacticMaterial
	"validates the material"
	
	(aDidacticMaterial uri)
		ifNil: [self error: 'URI cannot be empty!'] 
		ifNotNil: [
			(items includesKey: (aDidacticMaterial uri))
				ifTrue: [
					"There is a DidacticMaterial with the same URI"
					(aDidacticMaterial ~= (items at: (aDidacticMaterial uri)))
						"Checked if its not the same instance. Raise an error only if it's a different material"
						ifTrue: [self error: 'Another didactic material with URI *', aDidacticMaterial uri, '* already exists!']
				]
		].

	(aDidacticMaterial title) ifNil: [self error: 'Title cannot be empty!'].