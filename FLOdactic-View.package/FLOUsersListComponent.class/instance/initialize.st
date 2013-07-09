as yet unclassified
initialize
	super initialize.
	search := SearchEngine new.
	"Search all users"
	self searchUsers: nil.
	"Filter results by 'all' (i.e. do not filter)"
	self filterAllUsers
