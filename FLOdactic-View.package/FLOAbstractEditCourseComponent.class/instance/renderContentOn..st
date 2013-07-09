as yet unclassified
renderContentOn: html
	html div class: 'page-header'; with: [
		self renderPageHeaderOn: html ].

	self renderMessageOn: html.  
	
	html form id: #form; class: 'form-horizontal';
		with: [
			self renderFormFieldsOn: html.

			html div class: 'control-group'; with: [
				html div class: 'controls'; with: [
					html submitButton
						class: 'btn';
						value: 'Save';
						callback: [ self save ] ] ] ]