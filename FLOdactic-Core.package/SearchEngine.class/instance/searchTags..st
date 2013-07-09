searching
searchTags: aStringExpression
	"Searches for Tags that match the following criteria:
	- name matches the informed search string aStringExpression"
		
	| searchExpression |
	
	searchResults := nil.
	
	(aStringExpression isEmptyOrNil)
		ifFalse: [
			searchExpression := self wildCardExpression: aStringExpression.
			searchResults := tagsManager select: [ :tag | (searchExpression match: tag name) ] ]
		ifTrue: [
			searchResults := tagsManager items ].
	^ searchResults