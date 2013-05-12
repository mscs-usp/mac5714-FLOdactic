filtering
filterDidacticMaterialsByAuthorName: anAuthorNameString
	"Filter expression by Author's name"

	"okay here's another crazy idea... this should return a block that acts as a filter,
	so the filter strategy is a generic algorithm with just 'plugins' of code!"
	| test searchExpression |
	self checkNullSearch: anAuthorNameString.
	test := self checkNullResults.
	test ifFalse: [
		searchExpression := self wildCardExpression: anAuthorNameString.
		^ [ :didacticMaterial | didacticMaterial matchesAuthorsByName: searchExpression].
	].