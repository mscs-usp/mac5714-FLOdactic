testing
validate: anAuthor	
	(anAuthor name)
		ifNil: [
			ValidationError signal: 'Author''s name cannot be empty!'.
		] 
		ifNotNil: [
			(items includesKey: (anAuthor name))
				ifTrue: [
					(anAuthor ~= (items at: (anAuthor name)))
						ifTrue: [
							self error: 'Another author with name *', anAuthor name, '* already exists!'.
						]
				]
		].
