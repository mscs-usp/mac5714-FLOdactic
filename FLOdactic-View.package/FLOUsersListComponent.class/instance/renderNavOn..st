as yet unclassified
renderNavOn: html
	"Renders the navigation panel (aka nav) for this page. In this case, the nav will contain:
	- a search box to search users
	- a collection of links to filter the list by user type"
	html unorderedList class: 'nav nav-list'; with: [
		html listItem class: 'nav-header'; with: 'Search'.
		html listItem: [
			html form class: 'form-search'; with: [
				html div class: 'input-append'; with: [
					html textInput class: 'span2 search-query';
						value: searchText;
						callback: [ :value |  self searchUsers: value].
					html submitButton class: 'btn'; with: 'Go' ] ] ].
		html listItem class: 'divider'.
		html listItem class: 'nav-header'; with: 'Show'.
		html listItem: [  
			html anchor
				callback: [ self filterAllUsers ];
				with: 'All' ].
		html listItem: [
			html anchor
				callback: [ self filterAllAdministrators ];
				with: 'Administrators' ].
		html listItem: [
			html anchor
				callback: [ self filterAllModerators ];
				with: 'Moderators' ] ]