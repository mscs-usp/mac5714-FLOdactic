as yet unclassified
findActualItem: anItem
	"Finds and return the real persisted item. This method assumes the argument anItem is just a copy of the real Item."
	| parent item |
	
	anItem parent
		ifNil: [ ^ items at: ( anItem code ) ifAbsent: [] ]
		ifNotNil: [ parent := self findActualItem: anItem parent ].
	
	parent ifNil: [
		ValidationError signal: 'The item you are trying to update is orphan! Poor thing!' ].
	
	item := parent children at: ( anItem code ) ifAbsent: [].
	
	item ifNil: [
		ValidationError signal: 'The item you are trying to update does not exist!' ].
	
	^ item