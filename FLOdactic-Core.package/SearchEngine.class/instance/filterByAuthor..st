as yet unclassified
filterByAuthor: anAuthorString
	"comment stating purpose of message"

	"okay here's another crazy idea... this should return a block that acts as a filter!"
	| test searchExpression |
	self checkNullSearch: anAuthorString.
	test := self checkNullResults.
	test ifFalse: [
		searchExpression := self wildCardExpression: anAuthorString.
		"If this works... it most probably could be optimized and beautified!"
		^ [ :didacticMaterial | searchExpression match: ((didacticMaterial author) name)].
		"(didacticMaterialsManager select: [ :didacticMaterial | (anAuthorString match: didacticMaterial author)]) items."
	].