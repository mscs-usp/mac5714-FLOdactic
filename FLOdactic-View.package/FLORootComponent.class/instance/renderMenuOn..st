as yet unclassified
renderMenuOn: html
	html unorderedList class: 'nav'; with: [
		menu do: [ :titleAndClass |
			html listItem
				class: 'active' if: currentPage class = titleAndClass value class;
				with: [
					html anchor
						useBaseUrl;
						callback: [currentPage := titleAndClass value new ];
						extraPath: (self pathFor: titleAndClass value title);
						with: [
							html html: '<i class="', (titleAndClass value icon), '"></i> '.
							html text: titleAndClass key ] ] ] ]