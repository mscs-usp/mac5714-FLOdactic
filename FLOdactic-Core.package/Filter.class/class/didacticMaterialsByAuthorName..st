as yet unclassified
didacticMaterialsByAuthorName: anAuthorNameString
	"Filter expression by Author's name"

	"okay here's another crazy idea... this should return a block that acts as a filter,
	so the filter strategy is a generic algorithm with just 'plugins' of code!"
	| searchExpression |
	self isSearchingAString: anAuthorNameString.
	searchExpression := self defaultFilterPolicy: anAuthorNameString.
	^ [ :didacticMaterial | didacticMaterial matchesAuthorsByName: searchExpression].