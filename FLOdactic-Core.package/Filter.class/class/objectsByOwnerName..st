filtering
objectsByOwnerName: anOwnerString
	"Didactic material filter expression by owner"
	| searchExpression |
	
	self isSearchingAString: anOwnerString.
	searchExpression := self defaultFilterPolicy: anOwnerString.
	^ [ :object | object matchesByOwnerName: searchExpression].