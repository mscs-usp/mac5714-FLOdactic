as yet unclassified
initialize
	super initialize.
	selectedDidacticMaterials := Set new.
	allUsers := ( self facade allUsers ) values collect: [ :user | user username ].
	allDidacticMaterials := self facade allDidacticMaterials 
	