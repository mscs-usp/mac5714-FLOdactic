as yet unclassified
testWorkspace
	"This is an example of a possible use case of FLOdactic."

	| rawSearch filterDidacticMaterialByDescription search filterDidacticMaterialByStatus filterDidacticMaterialByTitle filterDidacticMaterialByType filterDidacticMaterialByTag filterDidacticMaterialByAuthorName rawSearch1 rawSearch2 filterDidacticMaterialByOwnerName filterDidacticMaterialByOwnerEmail filter |

	"Add special users to the session"
	ui01 addUser: admin01.
	ui01 addUser: moderator01.
	ui01 addUser: moderator02.
	
	ui01 addUser: albertUser.
	ui01 doLogin: 'albert' password: 'q'.
	ui01 loggedUser.

	ui01 addMaterial: material01.
	ui01 addMaterial: material02.
	
	self assert: ((material01 matchesByOwnerName: 'Albert De La Fuente') = true).	
	self assert: ((albertUser isUser) = true).
	self assert: ((albertUser isDisabled) = false).

	floogle := SearchEngine new.
	rawSearch := floogle searchDidacticMaterials: 'Python'.
	
	filterDidacticMaterialByAuthorName := floogle filterDidacticMaterialsByAuthorName: 'Albert De La Fuente'.
	search := floogle addFilter: filterDidacticMaterialByAuthorName.
	self assert: ((search size) = 1).
	
	filterDidacticMaterialByDescription := floogle filterDidacticMaterialsByDescription: 'tutorial'.
	search := floogle addFilter: filterDidacticMaterialByDescription.	
	self assert: ((search size) = 2).

	filterDidacticMaterialByStatus := floogle filterDidacticMaterialsByStatus: 'enabled'.
	search := floogle addFilter: filterDidacticMaterialByStatus.	
	self assert: ((search size) = 2).

	filterDidacticMaterialByTitle := floogle filterDidacticMaterialsByTitle: 'Python'.
	search := floogle addFilter: filterDidacticMaterialByTitle.	
	self assert: ((search size) = 2).

	filterDidacticMaterialByType := floogle filterDidacticMaterialsByType: 'document'.
	search := floogle addFilter: filterDidacticMaterialByType.	
	self assert: ((search size) = 2).
	
	filterDidacticMaterialByTag := floogle filterDidacticMaterialsByTag: 'Python'.
	search := floogle addFilter: filterDidacticMaterialByTag.	
	self assert: ((search size) = 2).
	
	"r1 := dm select: [:doc | ('*' match: doc title)].
	r2 := dm select: [:doc | ('*' match: doc title)]."

	"Add them to the FLOdactic User's Interface"
	
	"albert is logged in ui01"
	self assert: ((ui01 canRemove: albertUser) = true).
	self assert: ((ui01 canEdit: albertUser) = true).
	"The user can edit / delete it's own materials"
	self assert: ((ui01 canRemove: material01) = true).
	"Users cannot block users nor materials"
	self assert: ((ui01 canEdit: material01) = true).
	self assert: ((ui01 canDisable: albertUser) = false).
	self assert: ((ui01 canDisable: material01) = false).
	self assert: ((ui01 canDisable: igorUser) = false).

	ui02 doLogin: 'admin01' password: 'q'.
	"admin01, is logged in ui01. who can also edit / delete any user and document"
	self assert: ((ui02 canRemove: albertUser) = true).
	self assert: ((ui02 canEdit: albertUser) = true).
	self assert: ((ui02 canRemove: material01) = true).
	self assert: ((ui02 canEdit: material01) = true).
	"Only administrators can block users and didactic materials"
	self assert: ((ui02 canDisable: albertUser) = true).
	self assert: ((ui02 canDisable: material01) = true).
		
	ui03 doLogin: 'mod01' password: 'q'.
	"moderator01, is logged in ui03. who can also edit / delete any document, but not user"
	self assert: ((ui03 canRemove: albertUser) = false).
	self assert: ((ui03 canEdit: albertUser) = false).
	self assert: ((ui03 canRemove: material01) = true).
	self assert: ((ui03 canEdit: material01) = true).
	"Moderators can block only didactic materials"
	self assert: ((ui03 canDisable: albertUser) = false).
	self assert: ((ui03 canDisable: material01) = true).
	
	ui04 addUser: igorUser.
	ui04 doLogin: 'igor' password: 'q'.
	"This is a regular user (who's not the user itself), he can't edit / delete"
	self assert: ((ui04 canRemove: albertUser) = false).
	self assert: ((ui04 canEdit: albertUser) = false).
	"This user cannot edit / delete material01, since albert haven't yet authorized to do so"	
	self assert: ((ui04 canRemove: material01) = false).
	self assert: ((ui04 canEdit: material01) = false).

	"Permission granted as contributor"	
	ui01 addContributor: igorUser didacticMaterial: material02.
	self assert: ((material02 matchesContributorsByName: 'Igor Topcin') = false).
	
	"This is a regular user (who's not the user itself), he can't edit / delete"
	self assert: ((ui04 canRemove: albertUser) = false).
	self assert: ((ui04 canEdit: albertUser) = false).
	self assert: ((ui04 canDisable: albertUser) = false).
	"This user now can edit but not delete material01, since albert has authorized to do so"	
	self assert: ((ui04 canRemove: material02) = false).
	self assert: ((ui04 canEdit: material02) = true).
	self assert: ((ui04 canDisable: material02) = false).

	"Igor is editing Alberts material"
	Transcript show: 'Igor is editing Alberts material';cr.
"	material02Edited := material02 deepCopy."
	material02 addAuthor: albertAuthor.
	ui04 editDidacticMaterial: material02.

	"Search by author's name"	
	rawSearch := floogle searchDidacticMaterials: '*'.
	search := floogle addFilter: filterDidacticMaterialByAuthorName.
	self assert: ((search size) = 2).
	
	"Let's edit (update) the user's email address"
	albertUser username: 'albert'; password: 'q'; name: 'Albert De La Fuente'; email: 'albert@ime.usp.br'; withUserPrivileges; doEnable.
	ui01 editUser: albertUser.
	self assert: ((ui01 loggedUser email) = 'albert@ime.usp.br').

	"Search a didactic material by the owner's name"
	rawSearch := floogle searchDidacticMaterials: '*'.
	filterDidacticMaterialByOwnerName := floogle filterDidacticMaterialsByType: 'Albert'.
	search := floogle addFilter: filterDidacticMaterialByOwnerName.
	self assert: ((rawSearch size) = 2).
	
	"Search a didactic material by the owner's email"
	rawSearch := floogle searchDidacticMaterials: '*'.
	filterDidacticMaterialByOwnerEmail := floogle filterDidacticMaterialsByOwnerEmail: 'albert@ime.usp.br'.
	search := floogle addFilter: filterDidacticMaterialByOwnerEmail.
	self assert: ((rawSearch size) = 2).
	
	"Search all users"
	rawSearch := floogle searchUsers: '*'.
	self assert: ((rawSearch size) = 5).
	
	"Filter only administrators"
	filter := floogle filterUsersByRole: 'administrator'.
	search := floogle addFilter: filter.
	self assert: ((search size) = 1).
	
	"Filter only regular users"
	filter := floogle filterUsersByRole: 'user'.
	search := floogle addFilter: filter.
	self assert: ((search size) = 2).

	"Igor tries to remove the didactic material (why!!!!?)"
	rawSearch1 := floogle searchDidacticMaterials: '*'.
	ui04 removeDidacticMaterial: material02.
	rawSearch2 := floogle searchDidacticMaterials: '*'.
	self assert: ((rawSearch1 size) = (rawSearch2 size)).

	rawSearch1 := ui04 searchDidacticMaterials: '*'.
	
	"Igor reports for removal to the moderators"
	self assert: ((material02 isBlocked) = false).
	ui04 feedbackBlock: material02.
	self assert: ((material02 isBlocked) = true).
	self assert: ((material02 isEnabled) = false).
	self assert: ((material02 status) = 'blocked').
	
	"Moderator mod01 disables material02, we counted the
	number of items in rawSearch1 before Igor's request (see 5 lines before)"
	ui03 feedbackDisable: material02.
	self assert: ((material02 isDisabled) = true).
	rawSearch2 := ui04 searchDidacticMaterials: '*'.
	self assert: ((rawSearch1 size) = (rawSearch2 size + 1)).

	"Enable back a material. Only admins can do that"
	rawSearch2 := ui04 searchDidacticMaterials: '*'. "Igor's count"	
	ui02 feedbackEnable: material02.
	rawSearch1 := ui04 searchDidacticMaterials: '*'. "Igor's count"	
	self assert: ((rawSearch1 size) = (rawSearch2 size + 1)).
	
	"Moderator mod01 removes the didactic material"
	rawSearch1 := floogle searchDidacticMaterials: '*'.
	ui03 removeDidacticMaterial: material02.
	rawSearch2 := floogle searchDidacticMaterials: '*'.
	self assert: ((rawSearch1 size) = (rawSearch2 size + 1)).

	"Albert reports Igor"	
	self assert: ((igorUser isBlocked) = false).
	ui04 feedbackBlock: igorUser.
	self assert: ((igorUser isBlocked) = true).
	
	"Admin disables Igor"
	ui02 feedbackDisable: igorUser.
	self assert: ((igorUser isDisabled) = true).

	ui04 doLogout.
	self should: [ui04 doLogin: 'igor' password: 'q'] raise: PermissionError.

	"Administrator removes Igor"
	rawSearch1 := floogle searchUsers: '*'.
	ui02 removeUser: 'igor'.
	rawSearch2 := floogle searchUsers: '*'.
	self assert: ((rawSearch1 size) = (rawSearch2 size + 1)).
	
	"And Albert too"
	rawSearch1 := floogle searchUsers: '*'.
	ui02 removeUser: 'albert'.
	rawSearch2 := floogle searchUsers: '*'.
	self assert: ((rawSearch1 size) = (rawSearch2 size + 1)).