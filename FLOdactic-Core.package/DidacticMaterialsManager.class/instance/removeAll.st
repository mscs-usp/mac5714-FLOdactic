initialize-release
removeAll
	"Our dirty solution to avoid persistance in Squeak. In order to have the tests passing, we need to remove all the items on each test. This is not intended to be used by the API user"

	items keysDo: [:key | 
		Transcript show: 'Removing...', key printString; cr.
		items removeKey: key.
	].