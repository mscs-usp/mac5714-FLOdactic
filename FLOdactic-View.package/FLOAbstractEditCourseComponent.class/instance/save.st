as yet unclassified
save
	| success |
	isEditing ifFalse: [ item doEnable ].
	
	item tags keysDo: [ :key | item tags removeKey: key ].
	selectedTags do: [ :tagName |
		item addTag: tagName ].

	item colaborators keysDo: [ :key | item colaborators removeKey: key ].
	selectedColaborators do: [ :username |
		item addColaboratorByUsername: username ].

	success := true.
	[ isEditing
		ifTrue: [ self facade editCourse: item ]
		ifFalse: [ self facade addCourse: item ] ]
	on: ( ValidationError, PermissionError )
	do: [ :ex |
		success := false.
		self printError: ex messageText ].

	success ifTrue: [  
		self answer: success ].