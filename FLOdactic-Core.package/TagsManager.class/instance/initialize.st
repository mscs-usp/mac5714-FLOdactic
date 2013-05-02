as yet unclassified
initialize
	"Initializes the TagsManager structures
	- items: a Dictionary. We could have used a Set instead, but we found interesting to have a numerical index incremented and decremented regarding DidacticMaterials associated with that particular tag.
	"
	
	super initialize.
	items := Dictionary new.
	Transcript show: 'TagsManager initialize'.