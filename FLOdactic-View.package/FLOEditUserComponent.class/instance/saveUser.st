as yet unclassified
saveUser
	| success |
	updatePassword ifTrue: [  
		( confirmPassword = password ) ifFalse: [ 
			self printError: 'Typed passwords do not match'.
			^ self ]
		ifTrue: [
			user password: password ] ].

	success := true.
	[ self facade editUser: user ]
		on: ValidationError
		do: [ :ex |
			success := false.
			self printError: ex messageText ].
	
	success ifTrue: [ self facade doLogin: user ].
	
	self answer: success