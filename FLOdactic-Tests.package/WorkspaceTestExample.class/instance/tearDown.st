as yet unclassified
tearDown
	"User's interface"
	(ui01 = nil) ifFalse: [
		ui01 removeAll.
		ui01 release.
	].
	(ui02 = nil) ifFalse: [
		ui02 removeAll.
		ui02 release.
	].	
	(ui03 = nil) ifFalse: [
		ui03 removeAll.
		ui03 release.
	].
	(ui04 = nil) ifFalse: [
		ui04 removeAll.
		ui04 release.
	].
	
		
	"Special users objects"
	admin01 release.
	moderator01 release.
	moderator02 release.
	
	"Authors objects"
	albertAuthor release.
	
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
