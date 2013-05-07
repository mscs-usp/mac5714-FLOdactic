as yet unclassified
search: aStringExpression
	"comment stating purpose of message"

	| searchExpression test |
	test := self checkNullSearch: aStringExpression.
	(test) ifFalse: [
		searchExpression := '*', aStringExpression, '*'. "let's put some wildcards on it"
		resultsByTitle := (didacticMaterialsManager select: [:didacticMaterial | (searchExpression match: didacticMaterial title)]) items.
		resultsByDescription := (didacticMaterialsManager select: [:didacticMaterial | (searchExpression match: didacticMaterial title)]) items.
	
		"okay, here's a crazy idea... let's cast those results to Colleciton, and then addAll of them and return an OrderedCollection..."
		searchResults := (resultsByTitle asOrderedCollection) addAll: (resultsByDescription asOrderedCollection)..
	].
	^ searchResults