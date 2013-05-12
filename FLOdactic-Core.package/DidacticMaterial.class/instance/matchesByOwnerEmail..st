accessing
matchesByOwnerEmail: anExpression
	"Returns true if the didactic material' description matches anExpression"

	^ anExpression match: (owner email).
