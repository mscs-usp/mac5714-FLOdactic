as yet unclassified
coursesByStatus: aStatusString
	"Filter expression by status"

	| searchExpression |
	self isSearchingAString: aStatusString.
	searchExpression := self defaultFilterPolicy: aStatusString.
	^ [ :didacticMaterial | didacticMaterial matchesByStatus: searchExpression].