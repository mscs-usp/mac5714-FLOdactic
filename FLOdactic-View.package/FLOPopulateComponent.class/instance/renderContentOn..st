as yet unclassified
renderContentOn: html
	html div class: 'page-header'; with: [
		html heading: self title ].

	self renderMessageOn: html.
	
	html form id: #form; class: 'form-vertical';
		"onSubmit: (html javascript return: false);"
		with: [
			html div class: 'control-group'; with: [
				html div class: 'controls'; with: [
					html submitButton
						class: 'btn';
						value: 'Populate with test data';
						callback: [ self facade populateWithTestData ] ].
					html submitButton
						class: 'btn';
						value: 'Clear test data';
						callback: [ self facade removeAll ] ] ]