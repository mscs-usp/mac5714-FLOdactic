as yet unclassified
toggleEnable: anItem
	"Enables or disables a Course"
	| item |
	item := self findActualItem: anItem.
	item isEnabled
		ifTrue: [ item doDisable ]
		ifFalse: [ item doEnable ].

	Transcript show: 'Changing status of *', anItem code, '*'; cr.
	Transcript show: (anItem = item); cr.
	anItem touch.