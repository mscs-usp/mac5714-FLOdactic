searching
searchUsers: aStringExpression
	"Searches for Users that match the following criteria:
	- name matches the informed search string aStringExpression OR
	- username matches aStringExpression OR
	- email matches aStringExpression"
	
	| searchExpression |
	
	searchResults := nil.
	
	(aStringExpression isEmptyOrNil)
		ifFalse: [
			searchExpression := self wildCardExpression: aStringExpression.
			searchResults := usersManager select: [
				:user |
				(searchExpression match: user name) or:
				(searchExpression match: user username) or:
				(searchExpression match: user email)
			] ]
		ifTrue: [
			searchResults := usersManager items ].

	^ searchResults