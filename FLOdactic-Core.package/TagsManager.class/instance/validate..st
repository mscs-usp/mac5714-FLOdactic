as yet unclassified
validate: aTag
	"validates the tag, raising an error if:
	- name is empty
	- name is already being used by another tag"
	
	(aTag name)
		ifNil: [
			self error: 'Tag name cannot be empty!'.
		] 
		ifNotNil: [
			(items includesKey: (aTag name))
				ifTrue: [
					"There is a Tag with the same name"
					(aTag ~= (items at: (aTag name)))
						ifTrue: [
							self error: 'Another tag with name *', aTag name, '* already exists!'.
						]
				]
		].
