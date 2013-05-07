as yet unclassified
addFilter: aFilter
	"Applies aFilter to the searchResults and returns the new searchResults OrderedCollection"

	| oldResults |
	oldResults := searchResults veryDeepCopy.
	searchResults := oldResults select: aFilter.
	^ searchResults.
	