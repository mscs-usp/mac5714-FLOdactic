as yet unclassified
testAddWithEmptyLicense
	"comment stating purpose of message"

	material uri: 'uri'; title: 'title'; description: 'description'; type: 'type'.
	
	self should: [manager add: material.] raise: Exception