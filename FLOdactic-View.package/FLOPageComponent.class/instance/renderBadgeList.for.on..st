as yet unclassified
renderBadgeList: aList for: htmlIdSymbol on: html
	html unorderedList
		class: 'inline';
		with: [ aList do: [ :item |
			html listItem: [
				html span class: 'badge'; with: [
					html text: item, ' '.
					html anchor
						onClick: (html jQuery ajax
							callback: [ :value | aList remove: value ] value: item;
							script: [ :s | s << (s jQuery: htmlIdSymbol) html: [ :h | self renderBadgeList: aList for: htmlIdSymbol on: h ] ] );
						with: [ html html: '<i class="icon-remove"></i>' ] ] ] ] ]
