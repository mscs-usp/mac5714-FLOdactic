accessing
matchesContributorsByUsername: anExpression
	"Returns true if at least one of the contributors matches anExpression by its Username"

	| list |
	list := self selectContributorsByUsername: anExpression.
	^ (list size) > 0.
