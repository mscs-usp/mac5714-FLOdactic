accessing
matchesContributorsByName: anExpression
	"Returns true if at least one of the contributors name matches anExpression"

	| list |
	list := self selectContributorsByName: anExpression.
	^ (list size) > 0.
