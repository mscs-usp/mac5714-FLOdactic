as yet unclassified
renderContentOn: html
	html div class: 'row'; with: [
		html div class: 'span3'; with: [
			html div class: 'well flo-nav'; with: [
				self renderNavOn: html ] ].
		html div class: 'span9'; with: [
			html div class: 'page-header'; with: [
				html heading: self title].
			self renderBodyOn: html ] ].