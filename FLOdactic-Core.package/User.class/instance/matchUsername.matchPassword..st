accessing
matchUsername: aUsernameString matchPassword: aPasswordString 
	^ username = aUsernameString and: password = aPasswordString and: self isEnabled.