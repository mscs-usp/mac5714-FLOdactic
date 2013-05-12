accessing
selectContributorsByName: anExpression
	"Selects all the contributors whose names matches anExpression"

	^ contributors select: [ :contributor | anExpression match: (contributors name)].
