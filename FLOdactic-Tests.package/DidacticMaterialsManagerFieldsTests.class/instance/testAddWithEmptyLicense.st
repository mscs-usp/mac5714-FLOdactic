as yet unclassified
testAddWithEmptyLicense
	"comment stating purpose of message"

	material uri: 'uri'; title: 'title'; description: 'description'; type: 'type'.
	
	self should: [manager owner: user add: material] raise: ValidationError.