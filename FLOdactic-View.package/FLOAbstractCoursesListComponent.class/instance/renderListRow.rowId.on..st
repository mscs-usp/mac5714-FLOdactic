as yet unclassified
renderListRow: item rowId: id on: html
	| childrenComponent editComponent |
	childrenComponent := self createListChildrenComponent: item.
	editComponent := self createEditComponent: item.

	html paragraph class: 'text-info'; with: [
		
		( self canEnable: item ) ifTrue: [ | success styleClass |
			styleClass := 'label-important'.
			item isEnabled ifTrue: [ 
				styleClass := 'label-success' ].						
			html span class: 'label';
				id: id, 'enable';
				class: 'label ', styleClass;
				onClick: (html jQuery ajax
					callback: [ :value | success := self enable: item ] value: (html jQuery this) value;
					script: [ :s |
						self renderAjaxMessageOn: s.
						success ifTrue: [
							s << ( s jQuery: (id, 'enable') asSymbol ) toggleClass: 'label-success label-important' ] ] );
				with: [
					html html: '<i class="icon-ok"></i>' ] ].

		html text: ' '.		
		html span class: 'label'; with: item code.
		html strong: ' ', item title.
					
		childrenComponent ifNotNil: [
			html button
				class: 'btn btn-mini btn-link';
				callback: [ self call: childrenComponent ];
				with: 'View ', childrenComponent title ].

		( self canEdit: item ) ifTrue: [
			html button
				class: 'btn btn-mini btn-link';
				callback: [ self call: editComponent ];
				with: 'Edit' ].

		( self canRemove: item ) ifTrue: [
			html button
				class: 'btn btn-mini btn-link';
				bePush;
				onClick: ( html jQuery ajax
					script: [ :s |  self renderConfirmRemove: item rowId: id on: s] );
				with: 'Remove' ] ].

	html unorderedList
		class: 'inline';
		with: [
			item tags do: [ :tag |
				html listItem: [ html span class: 'badge'; with: tag name ] ] ].

	html text: item description