time
selectTagsByName: anExpression
	"Selects tags whose names matches anExpression (could be partly)"

	^ tags select: [ :tag | anExpression match: (tag name)].
