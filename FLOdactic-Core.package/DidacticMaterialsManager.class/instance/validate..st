testing
validate: aDidacticMaterial
	"validates the material"
	
	(aDidacticMaterial uri)
		ifNil: [
			ValidationError signal: 'URI cannot be empty!'.
		] 
		ifNotNil: [
			(items includesKey: (aDidacticMaterial uri))
				ifTrue: [
					"There is a DidacticMaterial with the same URI
					Checks if its not the same instance. Raise an error only if it's a different material"
					(aDidacticMaterial ~= (items at: (aDidacticMaterial uri)))
						ifTrue: [
							ValidationError signal: 'Another didactic material with URI *', aDidacticMaterial uri, '* already exists!'.
						]
				]
		].

	(aDidacticMaterial title) ifNil: [
		ValidationError signal: 'Title cannot be empty!'.
	].

	(aDidacticMaterial description) ifNil: [
		ValidationError signal: 'Description cannot be empty!'.
	].

	(aDidacticMaterial license) ifNil: [
		ValidationError signal: 'License cannot be empty!'.
	].

	(aDidacticMaterial type) ifNil: [
		ValidationError signal: 'Type cannot be empty!'.
	].
