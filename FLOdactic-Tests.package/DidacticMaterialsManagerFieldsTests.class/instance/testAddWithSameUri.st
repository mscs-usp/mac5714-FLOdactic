as yet unclassified
testAddWithSameUri
	"comment stating purpose of message"

	material1 uri: 'uri'; title: 'title'; description: 'description'; type: 'type'; license: 'license'.
	material2 uri: 'uri'; title: 'title'; description: 'description'; type: 'type'; license: 'license'.
	
	manager owner: user add: material1.
	
	self should: [manager owner: user add: material2] raise: ValidationError.