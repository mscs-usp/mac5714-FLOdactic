as yet unclassified
renderHeaderOn:  html
	html div class: 'navbar-inner'; with: [
		html div class: 'container'; with: [
			self renderLogoOn: html.
			html div class: 'nav-collapse collapse'; 
				with: [
					self renderMenuOn: html.
					self renderSessionMenuOn: html ] ] ]
