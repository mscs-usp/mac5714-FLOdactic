as yet unclassified
editUserFailed
	"Use of updateUser without being logged in"


	"Add special users to the session"
	ui01 addUser: admin01.
	ui01 addUser: moderator01.
	ui01 addUser: moderator02.
	
	ui01 addUser: albertUser.
	ui01 doLogin: 'albert' password: 'q'.
	ui01 doLogout.
	self assert: ((ui01 loggedUser) = nil).
	
	"Let's edit (update) the user's email address"
	albertUser username: 'albert'; password: 'q'; name: 'Albert De La Fuente'; email: 'albert@ime.usp.br'; withUserPrivileges; doEnable.
	self should: [ui01 updateUser: albertUser.] raise: Exception.