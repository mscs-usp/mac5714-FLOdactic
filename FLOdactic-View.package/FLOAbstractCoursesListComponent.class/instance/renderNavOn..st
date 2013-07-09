as yet unclassified
renderNavOn: html
	"Renders the navigation panel (aka nav) for this page."
	| showAdminMenu tagStrings authorStrings |
	html listItem class: 'nav-header'; with: 'Search'.
	html listItem: [
		html form class: 'form-search'; with: [
			html div class: 'input-append'; with: [
				html textInput class: 'span2 search-query';
					value: searchText;
					callback: [ :value | 
						searchText := value.
						self search ].
				html submitButton class: 'btn'; with: 'Go' ] ] ].
	html listItem class: 'divider'.
	
	self session isLoggedIn ifTrue: [
		html listItem: [
			html form: [
				html button
					class: 'btn btn-block btn-primary';
					callback: [ self call: ( self createEditComponent: nil ) ];
					with: 'Create' ] ].
		html listItem class: 'divider' ].
	
	html listItem class: 'nav-header'; with: 'Show'.
	html listItem: [  
		html anchor
			callback: [ self filterAll ];
			with: 'All' ].
		
"	showAdminMenu := ((self session facade) loggedUser) isAdmin or: ((self session facade) loggedUser) isModerator."
	showAdminMenu := true.
	showAdminMenu ifTrue: [
		html listItem class: 'nav-header'; with: 'Status'.
		html listItem: [  
			html anchor
				callback: [ self filterEnabled ];
				with: 'Enabled'.
			html anchor
				callback: [ self filterDisabled ];
				with: 'Disabled'.
		].
	].

	html listItem class: 'nav-header'; with: 'Tags'.
	tagStrings := ( (self facade allTags) values collect: [ :tag | tag name ] ) asSortedCollection.
	tagStrings do: [ :tag |
		html listItem: [  
			html anchor
				callback: [ self filterObjectByTag: tag ];
				with: tag ] ].

		html listItem class: 'nav-header'; with: 'Owners'.
		authorStrings := ( (self facade allUsers) values collect: [ :owner | owner name ] ) asSortedCollection.
		authorStrings do: [ :owner |
			html listItem: [  
				html anchor
					callback: [ self filterObjectsByOwner: owner ];
					with: owner ] ]
