as yet unclassified
initialize
	"self initialize"
	
	super initialize.
	items := Dictionary new.
	emailsMap := Dictionary new.
	Transcript show: 'UserManager initialize'; crlf.