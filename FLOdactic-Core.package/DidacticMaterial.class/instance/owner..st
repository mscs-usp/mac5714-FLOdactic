accessing
owner: anUser 
	| msg username |
	username := anUser username.

	(owners includesKey: username) ifTrue: [
		msg := 'User *', username, '* is already an owner for that material'.
		"counter := items at: aTagString."
		"tags add: aTagString -> (counter + 1)."
	].
	[(owners at: username)] ifError: [
		msg := 'User *', username, '* has been added as owner'.
		owners add: username -> anUser.
	].
	Transcript show: msg; cr.