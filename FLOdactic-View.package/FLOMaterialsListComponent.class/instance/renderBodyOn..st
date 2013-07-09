as yet unclassified
renderBodyOn: html
	html form id: #form; with: [
		"The search engine will apply the selected filter into the textual search results.
		The returned collection will contain only copies of the actual Materials, thus editing
		them will not change the actual Materials in the database."
		(search addFilter: filter) do: [ :material | | id |
		html blockquote
			id: (id := html nextId);
			with: [
				html paragraph class: 'text-info'; with: [
					( self canEnable: material ) ifTrue: [ | success styleClass |
						styleClass := 'label-important'.
						material isEnabled ifTrue: [ 
							styleClass := 'label-success' ].						
						html span class: 'label';
							id: id, 'enable';
							class: 'label ', styleClass;
							onClick: (html jQuery ajax
								callback: [ :value | success := self enable: material ] value: (html jQuery this) value;
								script: [ :s |
									self renderAjaxMessageOn: s.
									success ifTrue: [
										s << ( s jQuery: (id, 'enable') asSymbol ) toggleClass: 'label-success label-important' ] ] );
							with: [
								html html: '<i class="icon-ok"></i>' ] ].

					html text: ' '.
					html strong: material title, ' '.
					
					( self canEdit: material ) ifTrue: [
						html button
							class: 'btn btn-mini btn-link';
							callback: [ self call: (FLOEditMaterialComponent new edit: material) ];
							with: 'Edit' ].

					( self canRemove: material ) ifTrue: [
						html button
							class: 'btn btn-mini btn-link';
							bePush;
							onClick: ( html jQuery ajax
								script: [ :s |  self renderConfirmRemove: material id: id on: s] );
							with: 'Remove' ] ].
						
				html small: [material authors do: [ :author |
					html text: author name, ', ' ].
					html text: material uri ].

				html unorderedList
						class: 'inline';
						with: [
							html listItem: [ html span class: 'label label-info'; with: material type ].
							html listItem: [ html span class: 'label label-info'; with: material license ].
							material tags do: [ :tag |
								html listItem: [ html span class: 'badge'; with: tag name ] ] ].
				
				html text: material description ] ] ]