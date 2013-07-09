as yet unclassified
initialize
	super initialize.
	search := SearchEngine new.
	"Search all users"
	self search.
	"Filter results by 'all' (i.e. do not filter)"
	self filterAll
