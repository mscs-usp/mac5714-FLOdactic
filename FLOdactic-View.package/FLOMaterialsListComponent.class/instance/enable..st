as yet unclassified
enable: anObject
	| success |
	Transcript show: 'Changing status for ', anObject; cr.

	anObject isEnabled
		ifTrue: [ anObject doDisable ]
		ifFalse: [ anObject doEnable ].

	success := true.
	[ self facade toggleMaterialStatus: anObject ]
		on: ( ValidationError, PermissionError )
		do: [ :ex |
			success := false.
			self printError: ex messageText ].
	
	success ifTrue: [
		self printSuccess: [ :html | html strong: anObject title; text: ' is now ', anObject status ] ].
	^ success
	