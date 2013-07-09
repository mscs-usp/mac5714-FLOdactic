initialize-release
removeAll
	"This is for testing purposes, persistent objects within tests are breaking some of the tests"

	courses ifNotNil: [
		courses removeAll.
		courses release.
	].

	users ifNotNil: [
		users removeAll.
		users release.
	].

	authors ifNotNil: [
		authors removeAll.
		authors release.
	].
	
	didacticMaterials removeAll.
	didacticMaterials release.

	tags removeAll.
	tags release.