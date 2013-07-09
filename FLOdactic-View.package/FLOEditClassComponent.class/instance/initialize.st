as yet unclassified
initialize
	super initialize.
	allUsers := ( self facade allUsers ) values collect: [ :user | user username ]
	