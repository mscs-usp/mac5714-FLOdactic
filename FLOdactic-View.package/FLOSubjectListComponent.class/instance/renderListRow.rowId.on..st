as yet unclassified
renderListRow: item rowId: id on: html
	super renderListRow: item rowId: id on: html.

	html small: [
		html text: 'Professor: '.
		item responsibleProfessor ifNotNil: [  
			html text: item responsibleProfessor name, ' (', item responsibleProfessor username, ')' ] ].

	item workload isEmptyOrNil ifFalse: [
		html small: [
			html text: 'Workload: '; strong: item workload; text: ' hours/week' ] ].

	html small: [
		html text: 'Didactic materials: '.
		item didacticMaterials do: [ :mat |
			html text: ' '.
			html span class: 'label label-warning'; with: mat title ] ].