accessing
matchesAuthorsByName: anExpression
	"Returns true if at least one of the authors name matches anExpression"

	| list |
	list := self selectAuthorsByName: anExpression.
	^ (list size) > 0.
