filtering
didacticMaterialsByTitle: aTitleString
	"Filter expression by Title"

	"okay here's another crazy idea... this should return a block that acts as a filter,
	so the filter strategy is a generic algorithm with just 'plugins' of code!"
	| searchExpression |
	self isSearchingAString: aTitleString.
	searchExpression := self defaultFilterPolicy: aTitleString.
	^ [ :didacticMaterial | didacticMaterial matchesByTitle: searchExpression].