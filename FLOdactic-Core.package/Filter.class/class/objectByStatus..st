as yet unclassified
objectByStatus: aStatusString
	"Filter expression by status"

	| searchExpression |
	self isSearchingAString: aStatusString.
	searchExpression := self defaultFilterPolicy: aStatusString.
	^ [ :object | object matchesByStatus: searchExpression].