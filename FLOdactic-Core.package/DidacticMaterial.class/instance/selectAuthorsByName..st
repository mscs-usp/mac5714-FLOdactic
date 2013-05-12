accessing
selectAuthorsByName: anExpression
	"Selects all the authors whose names matches anExpression"

"	^ authors select: [ :author | 
		author name ifNotNil: [
			anExpression match: (author name)
		]
		ifNil: [
			false.
		]
	]."

	^ authors select: [ :author | anExpression match: (author name)].
