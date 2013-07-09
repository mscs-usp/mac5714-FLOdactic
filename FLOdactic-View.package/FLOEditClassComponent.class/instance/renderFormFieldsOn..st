as yet unclassified
renderFormFieldsOn: html
	super renderFormFieldsOn: html.
	
	self renderLabel: 'Instructor'
		forControl: [ :id |
			html select
				id: id;
				callback: [ :value | selectedInstructorUser := value ];
				selected: selectedInstructorUser;
				list: allUsers ]
		on: html.
		
	self renderLabel: 'Starts on'
		forControl: [ :id |
			html textInput
				class: 'span2';
				id: id;
				script: (html jQuery new datepicker);
				on: #startDate of: item ]
		on: html.
		
	self renderLabel: 'Ends on'
		forControl: [ :id |
			html textInput
				class: 'span2';
				id: id;
				script: (html jQuery new datepicker);
				on: #endDate of: item ]
		on: html