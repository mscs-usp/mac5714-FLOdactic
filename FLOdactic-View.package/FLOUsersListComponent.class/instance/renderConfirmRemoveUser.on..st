as yet unclassified
renderConfirmRemoveUser: aUser on: script
	| success |
	self printAlert: [ :html |
		html text: 'Remove ', aUser username, '? '.
		html button
			bePush;
			onClick: ( html jQuery ajax
				callback: [ :value | success := self removeUser: value ] value: aUser username;
				script: [ :s | 
					success ifTrue: [ s << ( html jQuery: aUser username asSymbol ) remove ].
					self renderAjaxMessageOn: s ] );
			class: 'btn btn-warning btn-mini'; with: 'Confirm'.
		html text: ' '.
		html button
			bePush;
			onClick: ( ( html jQuery: '.alert' ) remove );
			class: 'btn btn-info btn-mini'; with: 'Leave' ].
	self renderAjaxMessageOn: script
