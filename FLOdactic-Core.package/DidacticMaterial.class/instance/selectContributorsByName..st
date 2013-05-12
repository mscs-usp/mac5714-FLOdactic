accessing
selectContributorsByName: anExpression
	"Selects all the authors whose names matches anExpression"

"	^ authors select: [ :author | 
		author name ifNotNil: [
			anExpression match: (author name)
		]
		ifNil: [
			false.
		]
	]."

	^ contributors select: [ :contributor | anExpression match: (contributors name)].
