as yet unclassified
filterDidacticMaterialsByTag: aTagString
	"Didactic material filter expression by Author's name"

	"okay here's another crazy idea... this should return a block that acts as a filter,
	so the filter strategy is a generic algorithm with just 'plugins' of code!"
	| test searchExpression |
	self checkNullSearch: aTagString.
	test := self checkNullResults.
	test ifFalse: [
		searchExpression := self wildCardExpression: aTagString.
		^ [ :didacticMaterial | didacticMaterial matchesTagByName: searchExpression].
	].