Transcript cr; show: 'travis--->patch_gemstone.st'.
FileDirectory compile: 'fileNamed: localFileName do: aBlock
	| file |
	file := self fileNamed: localFileName.
	^ [ aBlock value: file ] ensure: [ file close ]'.

