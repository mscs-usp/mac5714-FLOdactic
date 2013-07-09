as yet unclassified
renderConfirmRemove: aMaterial id: id on: script
	| success |
	self printAlert: [ :html |
		html text: 'Remove '; strong: aMaterial title; text: '? '.
		html button
			bePush;
			onClick: ( html jQuery ajax
				callback: [ :value | success := self removeMaterial: aMaterial ] value: aMaterial uri;
				script: [ :s | 
					success ifTrue: [ s << ( html jQuery: id asSymbol ) remove ].
					self renderAjaxMessageOn: s ] );
			class: 'btn btn-warning btn-mini'; with: 'Confirm'.
		html text: ' '.
		html button
			bePush;
			onClick: ( ( html jQuery: '.alert' ) remove );
			class: 'btn btn-info btn-mini'; with: 'Leave' ].
	self renderAjaxMessageOn: script
