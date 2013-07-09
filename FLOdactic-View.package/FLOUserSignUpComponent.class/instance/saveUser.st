as yet unclassified
saveUser
	| success |
	( confirmPassword = user password ) ifFalse: [ 
		self printError: 'Typed passwords do not match'.
		^ self ].
	user withUserPrivileges doEnable.

	success := true.
	[ self facade addUser: user ]
		on: ValidationError
		do: [ :ex |
			success := false.
			self printError: ex messageText ].
	
	success ifTrue: [ self facade doLogin: user ].
	
	self answer: success