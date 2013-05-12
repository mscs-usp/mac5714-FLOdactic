initialize-release
initialize
	"Class responsability: handle didactic materials associations with other objects (authors, contributors, tags, etc)"
	
	super initialize.
	items := Dictionary new.
	Transcript show: 'DidacticMaterialManager initialize'; cr.