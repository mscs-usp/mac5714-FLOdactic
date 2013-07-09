as yet unclassified
renderContentOn: html
	html div class: 'page-header'; with: [
		html heading: self title ].

	self renderMessageOn: html.
	
	html form id: #form; class: 'form-horizontal';
		with: [
			self renderLabel: 'Username'
				forControl: [ :id |
					html textInput
						id: id;
						callback: [ :value | username := value ];
						value: username ]
				on: html.

			self renderLabel: 'Password'
				forControl: [ :id |
					html passwordInput
						id: id;
						callback: [ :value | password := value ] ]
				on: html.

			html div class: 'control-group'; with: [
				html div class: 'controls'; with: [
					html submitButton
						class: 'btn';
						value: 'Sign in';
						callback: [ self signOn ] ] ] ]