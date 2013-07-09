initialization
initialRequest: aRequest
	"Based on the url, finds the apropriate page to render"
	| requestPath |
	super initialRequest: aRequest.
	
	requestPath := aRequest url path.
	requestPath isEmpty ifFalse: [
		(pages includesKey: requestPath last) ifTrue: [
			currentPage := (pages at: requestPath last) new ] ]
