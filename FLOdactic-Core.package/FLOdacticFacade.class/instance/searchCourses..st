accessing
searchCourses: aStringExpression
	"Returns an ordered collection with the search results by aStringExpression,
	by default only enabled documents will be shown"

	| results filter |
	results := search searchCourses: aStringExpression.
	((loggedUser isAdmin) or: (loggedUser isModerator)) ifTrue: [	
		filter := search filterAll.
	]
	ifFalse: [
		filter := Filter coursesByStatus: 'enabled'. "TODO!"
	].
	results := search addFilter: filter.
	^ results