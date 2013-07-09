accessing
addFilter: aFilter
	"Applies aFilter to the searchResults and returns the new results OrderedCollection"

	| oldResults results test |
	test := self checkNullResults.
	test ifFalse: [
		oldResults := searchResults veryDeepCopy.
		results := oldResults select: aFilter.
	].
	^ results.
"Do not uncomment the following line. The search screens assume the searchResults are never modified when a filter is added."
"	searchResults := results"
	