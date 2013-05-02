as yet unclassified
singleton

	uniqueInstance ifNil: [
		Transcript show: 'Creating the singleton instance of UsersManager...'; crlf.
		uniqueInstance := self basicNew initialize
	].
	^ uniqueInstance