as yet unclassified
feedbackDisable: anObject
	"Changes the status of anObject to disabled so admin or moderators can review the object (user
	or didactic material), and if so block it or not"
	
	(self canDisable: anObject) ifTrue: [
		anObject doDisable.
	].