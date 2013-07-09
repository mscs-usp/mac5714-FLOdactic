as yet unclassified
renderContentOn: html
	html div class: 'page-header'; with: [
		html heading: self title ].

	self renderMessageOn: html.  
	
	html form id: #form; class: 'form-horizontal';
		with: [
			self renderLabel: 'Title'
				forControl: [ :id |
					html textInput
						class: 'span5';
						id: id;
						on: #title of: material.
					html span
						class: 'help-block';
						with: [ html small: 'Make sure you choose a meaningful title. This will be displayed on the front page.' ] ]
				on: html.
				
			self renderLabel: 'Type of material'
				forControl: [ :id |
					html select
						id: id;
						on: #type of: material;
						list: DidacticMaterial allTypes ]
				on: html.
				
			self renderLabel: 'Type of open license'
				forControl: [ :id |
					html select
						id: id;
						on: #license of: material;
						list: DidacticMaterial allLicenses ]
				on: html.
  
			self renderLabel: 'URI'
				forControl: [ :id |
					isEditing ifFalse: [ 
						html textInput
							class: 'span5';
							id: id;
							on: #uri of: material.
						html span
							class: 'help-block';
							with: [ html small: 'This uniquely identifies your material in FLOdactic. If your material is an website, you should inform the internet address where your material is located. If your material is a book, you may inform an internet address or the ISBN number.' ] ]
					ifTrue: [
						html textInput
							disabled;
							class: 'span5';
							id: id;
							value: material uri ] ]
				on: html.
				
			self renderLabel: 'Description'
				forControl: [ :id |
					html textArea
						rows: 3;
						class: 'span5';
						id: id;
						on: #description of: material ]
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
				
			self renderLabel: 'Authors'
				forControl: [ :id |
					self renderAutocompleteList: selectedAuthors
						searchCallback: [ :term | self searchAuthorNamesBy: term ]
						id: id
						on: html.
					html span
						class: 'help-block';
						with: [ html small: 'Start typing to search. Hit enter to add an author.' ] ]
				on: html.
				
			self renderLabel: 'Contributors'
				forControl: [ :id |
					self renderAutocompleteList: selectedUsers
						searchCallback: [ :term | self searchUserNamesBy: term ]
						id: id
						on: html.
					html span
						class: 'help-block';
						with: [ html small: 'Start typing to search. Hit enter to add a contributor.' ] ]
				on: html.

			html div class: 'control-group'; with: [
				html div class: 'controls'; with: [
					html submitButton
						class: 'btn';
						value: 'Save';
						callback: [ self saveDidacticMaterial ] ] ] ]