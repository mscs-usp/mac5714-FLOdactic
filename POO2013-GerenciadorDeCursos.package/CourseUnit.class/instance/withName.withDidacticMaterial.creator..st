as yet unclassified
withName: aName withDidacticMaterial: aDidacticMaterial creator: aCreator

	self initializeWithName: aName creator: aCreator.
	
	"It's assumed that aDidacticMaterial has been already validated"
	self addDidacticMaterial: aDidacticMaterial.  