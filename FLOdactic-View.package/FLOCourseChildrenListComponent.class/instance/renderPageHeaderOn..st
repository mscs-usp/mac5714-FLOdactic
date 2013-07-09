as yet unclassified
renderPageHeaderOn: html
	html heading: [
		html text: self title.
		parent ifNotNil: [
			html small: [
				html text: ' of '.
				html anchor
					callback: [ self answer ];
					with: parent title ] ] ]