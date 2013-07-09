as yet unclassified
signOn
	| success |
	username isEmptyOrNil ifTrue: [ 
		self printError: 'Please enter your username'.
		^ self].

	password isEmptyOrNil ifTrue: [ 
		self printError: 'Please enter your password'.
		^ self].

	success := true.
	[ self facade doLogin: username password: password ]
		on: PermissionError
		do: [ :ex |
			success := false.
			self printError: ex messageText ].
	
	success ifTrue: [
		"Redirect to the main page"
		self requestContext redirectTo: self application url ]