as yet unclassified
checkNullResults
	"comment stating purpose of message"

	| test |
	test := searchResults = nil.
	(test) ifTrue: [
		self error: 'You must first search and then add filters to the results.'.
	].
	^ test.