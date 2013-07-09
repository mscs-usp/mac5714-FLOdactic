as yet unclassified
renderFormFieldsOn: html
	super renderFormFieldsOn: html.
	
	self renderLabel: 'Date'
		forControl: [ :id |
			html textInput
				class: 'span2';
				id: id;
				script: (html jQuery new datepicker);
				on: #date of: item ]
		on: html.

	self renderLabel: 'Didactic Materials'
		forControl: [ :id | 
			self renderAjaxMultiSelect: allDidacticMaterials
				selected: selectedDidacticMaterials
				labels: [ :item | item title ]
				id: id
				on: html.

			html span
				class: 'help-block';
				with: [ html small: 'Select a didactic material from the list to add it to this subject.' ] ]
		on: html