as yet unclassified
renderLogoOn: html
	html anchor class: 'brand';
		useBaseUrl;
		callback: [ currentPage := defaultPage new ];
		extraPath: (self pathFor: defaultPage title);
		with: [ html image
			altText: self title;
			url: (FLOBootstrapLibrary urlOf: #logoPng) ]
