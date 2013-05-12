searching
searchTags: aStringExpression
	"Searches for Tags that match the following criteria:
	- name matches the informed search string aStringExpression"
		
	| searchExpression |
	
	searchResults := nil.
	
	(self checkNullSearch: aStringExpression) ifFalse: [
		searchExpression := self wildCardExpression: aStringExpression.
		searchResults := tagsManager select: [ :tag | (searchExpression match: tag name) ]
	].
	^ searchResults