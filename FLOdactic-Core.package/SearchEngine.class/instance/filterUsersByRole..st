as yet unclassified
filterUsersByRole: aRoleString
	"Users filtered by type"
	| test searchExpression |
	
	self checkNullSearch: aRoleString.
	test := self checkNullResults.
	test ifFalse: [
		searchExpression := self wildCardExpression: aRoleString.
		^ [ :user | user matchesByRole: searchExpression].
	].