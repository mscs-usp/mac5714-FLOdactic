initialize-release
resetInstance
	"We couldn't sucessfuly delete objects in Squek so we reset the instance and it's attributes.
	Unelegant, we know, but we couln't find other better way"

	users removeAll..
	didacticMaterials removeAll.
	tags removeAll.
	
	users := nil.
	didacticMaterials := nil.
	tags := nil.
	search := nil.
	
	Transcript show: 'Clearing users interface...'; crlf.
	^ self