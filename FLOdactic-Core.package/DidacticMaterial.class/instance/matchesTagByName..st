accessing
matchesTagByName: anExpression
	"Returns true if at least one of the contributors name matches anExpression"

	| list |
	list := self selectTagsByName: anExpression.
	^ (list size) > 0.
