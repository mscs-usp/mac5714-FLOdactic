as yet unclassified
checkNullSearch: input
	"Checks if the filter's input parameter is null/empty and raises an error if so"
	| isInvalid |
	(isInvalid := input isString not) ifFalse: [
		isInvalid := input isEmpty
	].

	isInvalid ifTrue: [self error: 'Invalid search or filter expression'].
	^ isInvalid
