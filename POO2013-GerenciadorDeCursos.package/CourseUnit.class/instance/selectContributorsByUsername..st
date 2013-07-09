time
selectContributorsByUsername: anExpression
	"Selects all the contributor whose usernames matches anExpression"

	^ colaborators select: [ :contributor | anExpression match: (contributor username)].
