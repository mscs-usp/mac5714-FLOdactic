testing
matchesByStatus: anExpression
	"Returns true if the didactic material status matches anExpression"

	^ anExpression match: status.
