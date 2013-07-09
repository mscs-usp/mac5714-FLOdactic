as yet unclassified
renderPageHeaderOn: html
	html heading: [
		html text: self title.
		item parent ifNotNil: [
			html small: [
				html text: ' of '.
				html anchor
					callback: [ self answer ];
					with: item parent title ] ] ]