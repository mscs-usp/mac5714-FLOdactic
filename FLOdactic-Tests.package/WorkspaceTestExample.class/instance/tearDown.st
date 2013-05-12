as yet unclassified
tearDown
	"User's interface"
	ui01 removeAll.
	ui02 removeAll.
	ui03 removeAll.
	ui04 removeAll.
	
	ui01 release.
	ui02 release.
	ui03 release.
	ui04 release.
	
	"Special users objects"
	admin01 release.
	moderator01 release.
	moderator02 release.
	
	"Authors objects"
	"albertAuthor release."
	
	"didacticMaterialManager := DidacticMaterialsManager singleton."
	material01 release.
	material02 release.
	
	"SearchEngine"
	floogle release.
	
	"r1 := dm select: [:doc | ('*' match: doc title)].
	r2 := dm select: [:doc | ('*' match: doc title)]."

	"Create regular users objects"
	albertUser release.
	igorUser release.
