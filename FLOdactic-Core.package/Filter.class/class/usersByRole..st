filtering
usersByRole: aRoleString
	"Users filtered by type"
	| searchExpression |
	
	self isSearchingAString: aRoleString.
	searchExpression := self defaultFilterPolicy: aRoleString.
	^ [ :user | user matchesByRole: searchExpression].