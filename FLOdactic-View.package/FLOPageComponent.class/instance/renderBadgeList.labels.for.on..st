as yet unclassified
renderBadgeList: aList labels: aLabelsBlock for: htmlIdSymbol on: html
	html unorderedList
		class: 'inline';
		with: [ aList do: [ :item |
			html listItem: [
				html span class: 'badge'; with: [
					html text: ( aLabelsBlock value: item ), ' '.
					html anchor
						onClick: (html jQuery ajax
							callback: [ :value | aList remove: item ] value: ( aLabelsBlock value: item );
							script: [ :s | s << (s jQuery: htmlIdSymbol)
								html: [ :h | self renderBadgeList: aList labels: aLabelsBlock for: htmlIdSymbol on: h ] ] );
						with: [ html html: '<i class="icon-remove"></i>' ] ] ] ] ]
