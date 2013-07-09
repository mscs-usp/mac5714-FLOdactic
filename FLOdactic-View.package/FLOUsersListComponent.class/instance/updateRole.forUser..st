as yet unclassified
updateRole: aRole forUser: aUser
	| success |
	(aRole = 'user')
		ifTrue: [ aUser withUserPrivileges. Transcript show: 'User'; cr ].

	(aRole = 'administrator')
		ifTrue: [ aUser withAdminPrivileges. Transcript show: 'Admin'; cr ].

	(aRole = 'moderator')
		ifTrue: [ aUser withModeratorPrivileges. Transcript show: 'Moderator'; cr ].

	success := true.
	[ self facade editUser: aUser ]
	on: ( ValidationError, PermissionError )
	do: [ :ex |
		success := false.
		self printError: ex messageText ].
	
	success ifTrue: [  
		self printSuccess: [ :html | html strong: aUser username; text: '''s role was changed to ', aRole] ]