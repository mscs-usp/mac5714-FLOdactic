as yet unclassified
initialize
	"self initialize"
	
	super initialize.
	items := Dictionary new.
	emailsSet := Set new.
	Transcript show: 'UserManager initialize'.