as yet unclassified
renderFormFieldsOn: html
	super renderFormFieldsOn: html.
	
	self renderLabel: 'Workload'
		forControl: [ :id |
			html textInput
				class: 'span1';
				id: id;
				on: #workload of: item.
			html span
				class: 'help-inline';
				with: [ html small: 'hours/week' ].
			html span
				class: 'help-block';
				with: [ html small: 'Choose the amount of hours per week for this subject.' ] ]
		on: html.
	
	self renderLabel: 'Professor'
		forControl: [ :id |
			html select
				id: id;
				callback: [ :value | selectedProfessorUser := value ];
				selected: selectedProfessorUser;
				list: allUsers ]
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