as yet unclassified
saveDidacticMaterial
	| success |
	isEditing ifFalse: [ material doEnable ].
	
	material tags keysDo: [ :key | material tags removeKey: key ].
	selectedTags do: [ :tagName |
		material addTag: tagName ].

	material authors keysDo: [ :key | material authors removeKey: key ].
	selectedAuthors do: [ :authorName |
		material addAuthor: authorName ].

	material contributors keysDo: [ :key | material contributors removeKey: key ].
	selectedUsers do: [ :username |
		material addContributorByUsername: username ].

	success := true.
	[ isEditing
		ifTrue: [ self facade editDidacticMaterial: material ]
		ifFalse: [ self facade addMaterial: material ] ]
	on: ( ValidationError, PermissionError )
	do: [ :ex |
		success := false.
		self printError: ex messageText ].

	success ifTrue: [  
		self answer: success ]