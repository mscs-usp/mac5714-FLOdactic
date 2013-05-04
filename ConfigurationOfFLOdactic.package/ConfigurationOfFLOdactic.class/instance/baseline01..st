accessing
baseline01: spec
	<version: '0.1--baseline'>
	spec for: #common do: [
		spec blessing: #baseline.
		spec repository: 'http://github.com/poo2013pos/FLOdactic'.
		
		spec
			package: 'FLOdactic--Core';
			package: 'FLOdactic--Tests' with: [ spec requires: 'FLOdactic--Core' ] ].