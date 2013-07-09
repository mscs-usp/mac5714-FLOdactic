as yet unclassified
renderBodyOn: html
	html form id: #form; with: [
		self list do: [ :item | | id |
		html blockquote
			id: (id := html nextId);
			with: [
				self renderListRow: item rowId: id on: html ] ] ]