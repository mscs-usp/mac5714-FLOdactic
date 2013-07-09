as yet unclassified
removeMaterial: aMaterial
	| success |
	Transcript show: 'Removing ', aMaterial uri; cr.
	
	success := true.
	[ self facade removeDidacticMaterial: aMaterial ]
		on: Error
		do: [ :ex |
			success := false.
			self printError: ex messageText ].
		
	success ifTrue: [
		self printSuccess: aMaterial title,' was removed' ].

	^ success
	