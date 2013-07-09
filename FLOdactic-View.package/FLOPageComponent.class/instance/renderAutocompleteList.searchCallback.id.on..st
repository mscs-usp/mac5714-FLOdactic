as yet unclassified
renderAutocompleteList: aList searchCallback: aBlock id: id on: html
	| listId |
	listId := (id, 'list') asSymbol.
	html textInput
		class: 'span2';
		id: id;
		onEnter: (html jQuery ajax
			callback: [ :value | value ifNotEmpty: [ aList add: value ] ] value: (html jQuery this) value;
			script: [ :s |
				s << (s jQuery: listId) html: [ :h | self renderBadgeList: aList for: listId on: h ].
				s << (s jQuery: id asSymbol) value: '' ] );
		script: (html jQuery this autocomplete
			sourceCallback: aBlock ).
	html span
		class: 'help-inline';
		id: listId;
		with: [ self renderBadgeList: aList for: listId on: html ]