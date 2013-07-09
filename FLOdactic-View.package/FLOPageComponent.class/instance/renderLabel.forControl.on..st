as yet unclassified
renderLabel: aString forControl: aBlock on: html
	| id |
	html div class: 'control-group'; with: [
		html label class: 'control-label';
			for: (id := html nextId);
			with: aString.
		html div class: 'controls'; with: [ 
			aBlock value: id ] ]