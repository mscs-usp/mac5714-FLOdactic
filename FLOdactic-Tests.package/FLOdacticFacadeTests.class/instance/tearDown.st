as yet unclassified
tearDown
	"Executed after the test"

	testui removeUser: 'albert'.
	testui removeAll.
	testui release.
