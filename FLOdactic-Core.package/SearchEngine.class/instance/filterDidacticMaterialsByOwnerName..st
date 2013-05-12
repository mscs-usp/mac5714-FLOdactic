filtering
filterDidacticMaterialsByOwnerName: anOwnerString
	"Didactic material filter expression by owner"
	| test searchExpression |
	
	self checkNullSearch: anOwnerString.
	test := self checkNullResults.
	test ifFalse: [
		searchExpression := self wildCardExpression: anOwnerString.
		^ [ :didacticMaterial | didacticMaterial matchesByOwnerName: searchExpression].
	].