as yet unclassified
addFilter: aFilter
	"Applies aFilter to the searchResults and returns the new results OrderedCollection"

	| oldResults |
	oldResults := searchResults veryDeepCopy.
	^ oldResults select: aFilter.
"	^ searchResults."
	