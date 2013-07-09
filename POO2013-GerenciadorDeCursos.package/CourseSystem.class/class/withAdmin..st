instance creation
withAdmin: anAdmin
	^self basicNew 
		initializeWithAdmin: anAdmin creationDate: (DateAndTime now);
		yourself