as yet unclassified
tearDown
	"Executed after the tests"
	
	(testmanager1 = nil) ifFalse: [
		testmanager1 remove: testmaterial1.
		testmanager1 remove: testmaterial2.
		testmanager1 remove: testmaterial3.
	].

	authors := AuthorsManager singleton.
	(authors = nil) ifFalse: [
		authors removeAll.
		authors release.
	].