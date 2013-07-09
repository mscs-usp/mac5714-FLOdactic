initialize-release
toggleEnable: anItem
	"Enables or disables a Course"
	| item |
	(items includesKey: anItem uri) ifFalse: [
		ValidationError signal: 'The material you are trying to update does not exist' ].
	
	item := items at: anItem uri.

	item isEnabled
		ifTrue: [ item doDisable ]
		ifFalse: [ item doEnable ].

	Transcript show: 'Changing status of *', anItem title, '*'; cr.
	anItem touch.