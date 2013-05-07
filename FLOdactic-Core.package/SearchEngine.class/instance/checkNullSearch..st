as yet unclassified
checkNullSearch: input
	"comment stating purpose of message"

	| test |
	test := input = ''.
	(test) ifTrue: [
		self error: 'Invalid search or filter expression.'.
	].
	^ test.