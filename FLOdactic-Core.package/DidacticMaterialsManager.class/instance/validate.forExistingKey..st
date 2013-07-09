testing
validate: aDidacticMaterial forExistingKey: aURI
	"validates the material"
	
	(aDidacticMaterial uri isEmptyOrNil)
		ifTrue: [
			ValidationError signal: 'URI cannot be empty!'.
		] 
		ifFalse: [
			(aURI ~= nil) ifTrue: [
				(items includesKey: (aDidacticMaterial uri))
					ifTrue: [
						"There is a DidacticMaterial with the same URI"
						(aDidacticMaterial uri ~= aURI)
							ifTrue: [
								ValidationError signal: 'Another didactic material with URI *', aDidacticMaterial uri, '* already exists!'.
							]
					]
				]
		].

	(aDidacticMaterial title isEmptyOrNil) ifTrue: [
		ValidationError signal: 'Title cannot be empty!'.
	].

	(aDidacticMaterial description isEmptyOrNil) ifTrue: [
		ValidationError signal: 'Description cannot be empty!'.
	].

	(aDidacticMaterial license isEmptyOrNil) ifTrue: [
		ValidationError signal: 'License cannot be empty!'.
	].

	(aDidacticMaterial type isEmptyOrNil) ifTrue: [
		ValidationError signal: 'Type cannot be empty!'.
	].
