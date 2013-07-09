as yet unclassified
renderFormFieldsOn: html
	self renderLabel: 'Code'
		forControl: [ :id |
			isEditing ifFalse: [
				html textInput
					class: 'span5';
					id: id;
					on: #code of: item.
				html span
					class: 'help-block';
					with: [ html small: 'Code must be unique.' ] ]
			ifTrue: [
				html textInput
					disabled;
					class: 'span2';
					id: id;
					value: item code ] ]
		on: html.
				
	self renderLabel: 'Title'
		forControl: [ :id |
			html textInput
				class: 'span5';
				id: id;
				on: #title of: item.
			html span
				class: 'help-block';
				with: [ html small: 'Make sure you choose a meaningful title. This will be displayed on the front page.' ] ]
		on: html.
		
	self renderLabel: 'Description'
		forControl: [ :id |
			html textArea
				rows: 3;
				class: 'span5';
				id: id;
				on: #description of: item ]
		on: html.
		
	self renderLabel: 'Tags'
		forControl: [ :id |
			self renderAutocompleteList: selectedTags
				searchCallback: [ :term | self searchTagNamesBy: term ]
				id: id
				on: html.
			html span
				class: 'help-block';
				with: [ html small: 'Start typing to search. Hit enter to add a tag.' ] ]
		on: html.
		
	self renderLabel: 'Contributors'
		forControl: [ :id |
			self renderAutocompleteList: selectedColaborators
				searchCallback: [ :term | self searchUserNamesBy: term ]
				id: id
				on: html.
			html span
				class: 'help-block';
				with: [ html small: 'Start typing to search. Hit enter to add a contributor.' ] ]
		on: html.