initialization
initializeWithAdmin: anAdmin creationDate: aDate
	self initializeWithName: 'System' creator: anAdmin creationDate: aDate.

	admins := Set new add: anAdmin; yourself.
	users := Set new add: anAdmin; yourself.
	
	