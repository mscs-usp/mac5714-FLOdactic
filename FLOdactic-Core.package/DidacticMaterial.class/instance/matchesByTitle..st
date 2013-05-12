accessing
matchesByTitle: anExpression
	"Returns true if the didactic material' description matches anExpression"

	^ anExpression match: title.
