as yet unclassified
renderListRow: item rowId: id on: html
	super renderListRow: item rowId: id on: html.
	html small: [
		html text: 'Instructor: '.
		item instructor ifNotNil: [  
			html text: item instructor name, ' (', item instructor username, ')' ] ].
	
	( ( item startDate isEmptyOrNil ) and: ( item endDate isEmptyOrNil ) ) ifFalse: [
	html small: [
		item startDate isEmptyOrNil ifFalse: [
			html text: 'Starts on '; strong: item startDate, '. ' ].
		item startDate isEmptyOrNil ifFalse: [
			html text: 'Ends on '; strong: item endDate, '.' ] ] ].