as yet unclassified
validate: aCourse forExistingKey: aCode
	"validates a course"
	| collection |

	aCourse isCourse ifFalse: [
		(aCourse parent) ifNil: [
			ValidationError signal: 'A parent has to be defined!' ] ].
	
	(aCourse code) isEmptyOrNil
		ifTrue: [
			ValidationError signal: 'Code cannot be empty!'.
		] 
		ifFalse: [
			aCourse isCourse
				ifTrue: [ collection := items ]
				ifFalse: [ collection := aCourse parent children ].
				
			(collection includesKey: (aCourse code)) ifTrue: [
				(aCourse code ~= aCode) ifTrue: [
					ValidationError signal: 'The code *', aCourse code, '* already exists!' ] ] ].

	(aCourse description) isEmptyOrNil ifTrue: [
		ValidationError signal: 'Description cannot be empty!' ].

	(aCourse title) isEmptyOrNil ifTrue: [
		ValidationError signal: 'Title cannot be empty!' ]