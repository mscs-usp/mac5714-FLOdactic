as yet unclassified
renderAjaxMessageOn: script
	script << ( script jQuery: '.alert' ) remove.
	script << ( script jQuery: #form ) prepend:
		[ :html | self renderMessageOn: html ]