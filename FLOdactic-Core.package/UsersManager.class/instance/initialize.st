initialize-release
initialize
	"Class responsability: handles several users and encapsulates authentication methods"
	
	super initialize.
	items := Dictionary new.
	emailsMap := Dictionary new.
	Transcript show: 'UserManager initialize'; crlf.