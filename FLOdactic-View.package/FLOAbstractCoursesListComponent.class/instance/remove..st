as yet unclassified
remove: anObject
	| success |
	Transcript show: 'Removing ', anObject code; cr.
	
	success := true.
	[ self facade removeCourse: anObject ]
		on: Error
		do: [ :ex |
			success := false.
			self printError: ex messageText ].
		
	success ifTrue: [
		self printSuccess: anObject title,' was removed' ].

	^ success
	