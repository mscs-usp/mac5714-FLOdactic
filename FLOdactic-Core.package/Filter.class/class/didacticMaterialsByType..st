filtering
didacticMaterialsByType: aTypeString
	"Filter expression by description"

	"okay here's another crazy idea... this should return a block that acts as a filter,
	so the filter strategy is a generic algorithm with just 'plugins' of code!"
	| searchExpression |
	self isSearchingAString: aTypeString.
	searchExpression := self defaultFilterPolicy: aTypeString.
	^ [ :didacticMaterial | didacticMaterial matchesByType: searchExpression].