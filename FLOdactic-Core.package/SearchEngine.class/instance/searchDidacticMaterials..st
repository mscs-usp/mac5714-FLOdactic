searching
searchDidacticMaterials: aStringExpression
	"Returns an ordered collection of foun items by aStringExpression by all fields
	Later filters can by applied to narrow search results (as with google for instance)"

	| searchExpression |
	
	searchResults := nil.	
	(aStringExpression isEmptyOrNil)
		ifFalse: [
			searchExpression := self wildCardExpression: aStringExpression.
			searchResults := didacticMaterialsManager select: [
				:didacticMaterial |
				(searchExpression match: didacticMaterial title) or:
				(searchExpression match: didacticMaterial description)
			] ]
		ifTrue: [
			searchResults := didacticMaterialsManager items ].
		
"		resultsByTitle := (didacticMaterialsManager select: [:didacticMaterial | (searchExpression match: didacticMaterial title)]) items.
		resultsByDescription := (didacticMaterialsManager select: [:didacticMaterial | (searchExpression match: didacticMaterial description)]) items."
"		searchResults := (resultsByTitle asOrderedCollection) addAll: (resultsByDescription asOrderedCollection).."
	^ searchResults