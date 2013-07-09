as yet unclassified
remove: aCourse
	| collection |
	aCourse isCourse
		ifTrue: [ collection := items ]
		ifFalse: [ collection := ( self findActualItem: aCourse parent ) children ].
		
	( collection includesKey: aCourse code )
		ifTrue: [ collection removeKey: aCourse code ]
		ifFalse: [ self error: 'The course does not exists on the system, cannot remove it...' ]