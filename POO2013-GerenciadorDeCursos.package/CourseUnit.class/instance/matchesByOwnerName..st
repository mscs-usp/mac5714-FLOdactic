time
matchesByOwnerName: anExpression
	"Returns true if the didactic material owner's name matches anExpression"

	^ anExpression match: (owner name).
