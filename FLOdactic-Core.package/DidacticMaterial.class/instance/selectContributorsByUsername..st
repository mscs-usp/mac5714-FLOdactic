accessing
selectContributorsByUsername: anExpression
	"Selects all the contributor whose usernames matches anExpression"

	^ contributors select: [ :contributor | anExpression match: (contributor username)].
