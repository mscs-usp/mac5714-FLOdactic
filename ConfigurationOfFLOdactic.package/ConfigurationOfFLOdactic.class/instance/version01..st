accessing
version01: spec
	<version: '0.1' imports: #('baseline01')>
	spec for: #common do: [
		spec repository: 'http://github.com/poo2013pos/FLOdactic'.
		
		spec
		package: 'FLOdactic--Core' with: 'FLOdactic--Core--MichaelJones.10';
		package: 'FLOdactic--Tests' with: 'FLOdactic--Tests--JohnLewis.3' ].