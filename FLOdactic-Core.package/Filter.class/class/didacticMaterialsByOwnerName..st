filtering
didacticMaterialsByOwnerName: anOwnerString
	"Didactic material filter expression by owner"
	| searchExpression |
	
	self isSearchingAString: anOwnerString.
	searchExpression := self defaultFilterPolicy: anOwnerString.
	^ [ :didacticMaterial | didacticMaterial matchesByOwnerName: searchExpression].