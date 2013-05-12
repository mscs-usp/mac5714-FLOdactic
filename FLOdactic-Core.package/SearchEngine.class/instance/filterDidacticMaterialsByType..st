filtering
filterDidacticMaterialsByType: aTypeString
	"Filter expression by description"

	"okay here's another crazy idea... this should return a block that acts as a filter,
	so the filter strategy is a generic algorithm with just 'plugins' of code!"
	| test searchExpression |
	self checkNullSearch: aTypeString.
	test := self checkNullResults.
	test ifFalse: [
		searchExpression := self wildCardExpression: aTypeString.
		^ [ :didacticMaterial | didacticMaterial matchesByType: searchExpression].
	].