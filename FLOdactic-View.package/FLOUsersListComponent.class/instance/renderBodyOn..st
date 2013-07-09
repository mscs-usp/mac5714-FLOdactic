as yet unclassified
renderBodyOn: html
	html form id: #form; with: [
	html table class: 'table table-bordered table-hover'; with: [
		html tableRow: [ html
			tableHeading: 'Name';
			tableHeading: 'Username';
			tableHeading: 'Email';
			tableHeading: 'Role';
			tableHeading: 'Enabled';
			tableHeading].
		"The search engine will apply the selected filter into the textual search results.
		The returned collection will contain only copies of the actual users, thus editing
		them will not change the actual users in the database."
		(search addFilter: filter) do: [ :user |
			Transcript show: 'user:', user role; cr.
			html tableRow id: user username; with: [html
				tableData: user name;
				tableData: user username;
				tableData: user email;
				tableData: [ html select
					disabled: ( self canEdit: user ) not;
					selected: user role;  
					onChange: (html jQuery ajax
						callback: [ :value | self updateRole: value forUser: user ] value: (html jQuery this) value;
						script: [ :s | self renderAjaxMessageOn: s ] );
					list: #('user' 'moderator' 'administrator') ];
				tableData: [ 
					html checkbox
						disabled: ( self canEnable: user ) not;
						value: user isEnabled;
						onChange: (html jQuery ajax
							callback: [ :value | self updateUserStatus: user ] value: (html jQuery this) value;
							script: [ :s | self renderAjaxMessageOn: s ] ) ];
				tableData: [
					html button
						disabled: ( self canRemove: user ) not;
						bePush;
						onClick: ( html jQuery ajax
							script: [ :s |  self renderConfirmRemoveUser: user on: s] );
						class: 'btn btn-danger btn-mini'; with: 'Remove' ] ] ] ] ]
