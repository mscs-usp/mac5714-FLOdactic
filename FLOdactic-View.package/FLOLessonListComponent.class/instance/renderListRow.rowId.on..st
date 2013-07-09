as yet unclassified
renderListRow: item rowId: id on: html
	super renderListRow: item rowId: id on: html.

	item date isEmptyOrNil ifFalse: [
		html small: [
			html text: 'Date: '; strong: item date ] ].
	
	html small: [
		html text: 'Didactic materials: '.
		item didacticMaterials do: [ :mat |
			html text: ' '.
			html span class: 'label label-warning'; with: mat title ] ].