as yet unclassified
renderContentOn: html  
	html div id: 'canvas'; with: [
		html div class: 'navbar navbar-fixed-top';
			with: [ self renderHeaderOn: html ].
		html div class: 'container-fluid';
			with: [ self renderBodyOn: html ] ].
	"self renderTimeoutOn: html"