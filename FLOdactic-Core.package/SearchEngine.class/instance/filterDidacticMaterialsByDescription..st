as yet unclassified
filterDidacticMaterialsByDescription: aDescriptionString
	"Filter expression by description"

	"okay here's another crazy idea... this should return a block that acts as a filter,
	so the filter strategy is a generic algorithm with just 'plugins' of code!"
	| test searchExpression |
	self checkNullSearch: aDescriptionString.
	test := self checkNullResults.
	test ifFalse: [
		searchExpression := self wildCardExpression: aDescriptionString.
		^ [ :didacticMaterial | didacticMaterial matchesByDescription: searchExpression].
	].