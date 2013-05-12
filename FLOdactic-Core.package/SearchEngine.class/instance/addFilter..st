as yet unclassified
addFilter: aFilter
	"Applies aFilter to the searchResults and returns the new results OrderedCollection"

	| oldResults results |
	oldResults := searchResults veryDeepCopy.
	results := oldResults select: aFilter.
	^ results.
"	searchResults := results"
	