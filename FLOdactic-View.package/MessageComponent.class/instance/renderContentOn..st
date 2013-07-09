as yet unclassified
renderContentOn: html
	shown ifFalse: [
		html div class: 'alert alert-', type; with: [
			content isBlock
				ifTrue:  [ content value: html ]
				ifFalse: [ html text: content ] ].
		shown := true ]
