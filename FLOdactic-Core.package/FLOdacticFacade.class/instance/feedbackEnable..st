accessing
feedbackEnable: anObject
	"Changes the status of anObject to enabled so admin or moderators can review the object (user
	or didactic material), and if so block it or not"
	
	(self canEnable: anObject) ifTrue: [
		anObject doEnable.
	].