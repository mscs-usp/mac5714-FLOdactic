as yet unclassified
removeAll
	"This is for testing purposes, persistent objects within tests are breaking some of the tests"

	users removeAll.
	users release.
	
	didacticMaterials removeAll.
	didacticMaterials release.

	tags removeAll.
	tags release.