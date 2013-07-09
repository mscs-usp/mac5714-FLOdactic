searching
searchAuthors: aStringExpression
	"Searches for Authors that match the following criteria:
	- name matches the informed search string aStringExpression"
		
	| searchExpression |
	
	searchResults := nil.
	
	(aStringExpression isEmptyOrNil)
		ifFalse: [
			searchExpression := self wildCardExpression: aStringExpression.
			searchResults := authorsManager select: [ :author | (searchExpression match: author name) ] ]
		ifTrue: [
			searchResults := authorsManager items ].
	^ searchResults