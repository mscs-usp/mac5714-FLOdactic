as yet unclassified
removeUser: aUsername
	| success |
	Transcript show: 'Removing ', aUsername; cr.
	
	success := true.
	[ self facade removeUser: aUsername ]
		on: Error
		do: [ :ex |
			success := false.
			self printError: ex messageText ].
		
	success ifTrue: [
		self printSuccess: 'User ', aUsername,' was removed' ].

	^ success
	