ownership and permissions
matchesContributorsByUsername: anExpression
	"Returns true if at least one of the contributors username matches anExpression"

	| list |
	list := self selectContributorsByUsername: anExpression.
	^ (list size) > 0.
