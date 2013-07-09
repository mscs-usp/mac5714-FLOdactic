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
						id: id;
						on: #email of: user ]
				on: html.

			self renderLabel: 'Username'
				forControl: [ :id |
					html textInput
						id: id;
						on: #username of: user ]
				on: html.

			self renderLabel: 'Password'
				forControl: [ :id |
					html passwordInput
						id: id;
						callback: [ :value | user password: value ] ]
				on: html.

			self renderLabel: 'Confirm password'
				forControl: [ :id |
					html passwordInput
						id: id;
						callback: [ :value | confirmPassword := value ] ]
				on: html.

			html div class: 'control-group'; with: [
				html div class: 'controls'; with: [
					"html button
						bePush;
						onClick: ( html jQuery ajax
							serializeForm;
							onSuccess: (
								( html jQuery: '.alert' ) remove,
								( html jQuery: #form ) prepend:
									[ :h | h div class: 'alert alert-success'; with: 'test' ] ) );
						class: 'btn'; with: 'Sign in'"
					html submitButton
						class: 'btn';
						value: 'Sign up';
						callback: [ self saveUser ] ] ] ]