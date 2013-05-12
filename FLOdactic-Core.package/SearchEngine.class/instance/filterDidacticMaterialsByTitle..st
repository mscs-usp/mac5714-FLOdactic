as yet unclassified
filterDidacticMaterialsByTitle: aTitleString
	"Filter expression by Title"

	"okay here's another crazy idea... this should return a block that acts as a filter,
	so the filter strategy is a generic algorithm with just 'plugins' of code!"
	| test searchExpression |
	self checkNullSearch: aTitleString.
	test := self checkNullResults.
	test ifFalse: [
		searchExpression := self wildCardExpression: aTitleString.
		^ [ :didacticMaterial | didacticMaterial matchesByTitle: searchExpression].
	].