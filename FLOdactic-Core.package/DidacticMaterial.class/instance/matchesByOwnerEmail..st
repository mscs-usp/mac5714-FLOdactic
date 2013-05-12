testing
matchesByOwnerEmail: anExpression
	"Returns true if the didactic material owner's email matches anExpression"

	^ anExpression match: (owner email).
