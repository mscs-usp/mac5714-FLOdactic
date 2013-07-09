as yet unclassified
renderNavOn: html

	| authorStrings tagStrings |
	
	"Renders the navigation panel (aka nav) for this page."
	html unorderedList class: 'nav nav-list'; with: [
		html listItem class: 'nav-header'; with: 'Search'.
		html listItem: [
			html form class: 'form-search'; with: [
				html div class: 'input-append'; with: [
					html textInput class: 'span2 search-query';
						value: searchText;
						callback: [ :value | 
							searchText := value.
							self searchDidacticMaterials ].
					html submitButton class: 'btn'; with: 'Go' ] ] ].
		html listItem class: 'divider'.
		
		self session isLoggedIn ifTrue: [
			html listItem: [
				html form: [
					html button
						class: 'btn btn-block btn-primary';
						callback: [ self call: FLOEditMaterialComponent new ];
						with: 'Create' ] ].
			html listItem class: 'divider' ].
		
		html listItem: [  
			html anchor
				callback: [ self filterAllDidacticMaterials ];
				with: 'Show All' ].
		
		html listItem class: 'nav-header'; with: 'Types'.
		DidacticMaterial allTypes do: [ :type |
			html listItem: [  
				html anchor
					callback: [ self filterDidacticMaterialsByType: type ];
					with: type ] ].

		html listItem class: 'nav-header'; with: 'Tags'.
		tagStrings := ( (self facade allTags) values collect: [ :tag | tag name ] ) asSortedCollection.
		tagStrings do: [ :tag |
			html listItem: [  
				html anchor
					callback: [ self filterDidacticMaterialsByTag: tag ];
					with: tag ] ].

		html listItem class: 'nav-header'; with: 'Authors'.
		authorStrings := ( (self facade allAuthors) values collect: [ :author | author name ] ) asSortedCollection.
		authorStrings do: [ :author |
			html listItem: [  
				html anchor
					callback: [ self filterDidacticMaterialsByAuthor: author ];
					with: author ] ] ]
