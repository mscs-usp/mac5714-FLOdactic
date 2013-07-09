as yet unclassified
owner: anOwner add: aCourse
	"comment stating purpose of message"
	| collection |
	self validate: aCourse.
	
	Transcript show: 'The course: *', aCourse name, '* DOESNT exists!'; cr.
	
	aCourse parent ifNotNil: [
		aCourse parent: ( self findActualItem: aCourse parent ) ].
	
	aCourse owner: anOwner.
	aCourse doEnable.
	aCourse touch.
	
	aCourse isCourse
		ifTrue: [ collection := items ]
		ifFalse: [ collection := aCourse parent children ].
	
	collection add: aCourse code -> aCourse.