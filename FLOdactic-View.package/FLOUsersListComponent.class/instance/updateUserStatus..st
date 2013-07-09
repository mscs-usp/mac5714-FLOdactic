as yet unclassified
updateUserStatus: aUser
	| success |
	Transcript show: 'Changing status for ', aUser; cr.
	aUser isEnabled
		ifTrue: [ aUser doDisable ]
		ifFalse: [ aUser doEnable ].
	
	success := true.
	[ self facade editUser: aUser ]
	on: ( ValidationError, PermissionError )
	do: [ :ex |
		success := false.
		self printError: ex messageText ].
	
	success ifTrue: [
		self printSuccess: [ :html | html strong: aUser username; text: ' is now ', aUser status ] ]