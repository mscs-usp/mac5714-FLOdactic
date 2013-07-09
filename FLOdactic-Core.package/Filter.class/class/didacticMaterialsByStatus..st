as yet unclassified
didacticMaterialsByStatus: aStatusString
	"Filter expression by description"

	"okay here's another crazy idea... this should return a block that acts as a filter,
	so the filter strategy is a generic algorithm with just 'plugins' of code!"
	| searchExpression |
	self isSearchingAString: aStatusString.
	searchExpression := self defaultFilterPolicy: aStatusString.
	^ [ :didacticMaterial | didacticMaterial matchesByStatus: searchExpression].