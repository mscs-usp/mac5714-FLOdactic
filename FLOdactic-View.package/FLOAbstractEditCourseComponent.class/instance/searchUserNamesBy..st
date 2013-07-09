as yet unclassified
searchUserNamesBy: aString
	^ (search searchUsers: aString) values collect: [ :user | user username ]