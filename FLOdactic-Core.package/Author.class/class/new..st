instance creation
new: aName
	^ self basicNew
			initializeWithName: aName;
			yourself.
			