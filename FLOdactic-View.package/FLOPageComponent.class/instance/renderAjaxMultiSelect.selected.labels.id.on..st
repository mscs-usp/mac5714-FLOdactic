as yet unclassified
renderAjaxMultiSelect: aList selected: aSelectedList labels: aLabelsBlock id: id on: html
	| listId |
			listId := (id, 'list') asSymbol.
			html select
				beOptional;
				optionalLabel: '(select)';
				id: id;
				callback: [ :value | value ifNotNil: [ aSelectedList add: value ] ];
				onChange: (html jQuery ajax
					serialize: (html jQuery this);
					script: [ :s |
						s << (s jQuery: listId) html: [ :h | self renderBadgeList: aSelectedList labels: aLabelsBlock for: listId on: h ] ] );
				labels: [ :item | item title ];
				list: aList.
			
			html span
				class: 'help-inline';
				id: listId;
				with: [ self renderBadgeList: aSelectedList labels: aLabelsBlock for: listId on: html ].