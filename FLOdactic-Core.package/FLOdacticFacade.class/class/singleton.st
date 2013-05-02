as yet unclassified
singleton

	uniqueInstance ifNil: [
		Transcript show: 'Creating the singleton instance...'; crlf.
		uniqueInstance := self basicNew initialize
	].
	^ uniqueInstance