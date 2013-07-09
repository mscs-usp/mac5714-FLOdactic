as yet unclassified
initialize: aParent
	"make sure we refresh the parent's instance before everything else"
	parent := self facade refreshCourseObject: aParent.  
	self initialize