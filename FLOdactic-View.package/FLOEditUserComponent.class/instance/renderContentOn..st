as yet unclassified
renderContentOn: html
	html div class: 'page-header'; with: [
		html heading: self title ].

	self renderMessageOn: html.
	
	html form id: #form; class: 'form-horizontal';
		"onSubmit: (html javascript return: false);"
		with: [
			self renderLabel: 'Name'
				forControl: [ :id |
					html textInput
						id: id;
						on: #name of: user ]
				on: html.

			self renderLabel: 'Email'
				forControl: [ :id |
					html textInput
						disabled;
						id: id;
						value: user email ]
				on: html.

			self renderLabel: 'Username'
				forControl: [ :id |
					html textInput
						disabled;
						id: id;
						on: #username of: user ]
				on: html.

			self renderLabel: 'Change password'
				forControl: [ :id |
					html checkbox
						id: id;
						value: updatePassword;
						callback: [ :value | updatePassword := value ];
						onChange: ( (html jQuery: #passwordBox)
							perform: #toggle ) ]
				on: html.
			
			html div id: #passwordBox; class: 'well'; style: 'margin: 9px 0; padding: 9px 0;';
			script: (html jQuery this hide );
			with: [
				self renderLabel: 'Password'
					forControl: [ :id |
						html passwordInput
							id: id;
							callback: [ :value | password := value ] ]
					on: html.
	
				self renderLabel: 'Confirm password'
					forControl: [ :id |
						html passwordInput
							id: id;
							callback: [ :value | confirmPassword := value ] ]
					on: html ].

			html div class: 'control-group'; with: [
				html div class: 'controls'; with: [
					html submitButton
						class: 'btn';
						value: 'Save changes';
						callback: [ self saveUser ] ] ] ]