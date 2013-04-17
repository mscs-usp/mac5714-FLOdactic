| glassVersion versionString |
"upgrade to GemStone 1.0-beta.8.7.4 ... earliest support for FileTree, that loades into all versions"
Transcript cr; show: 'travis--->before_gemstone.st'.
glassVersion := ConfigurationOfGLASS project currentVersion.
versionString := '1.0-beta.8.7.4'.
Transcript cr; show: 'GLASS: ', glassVersion versionString.
Transcript cr; show: 'Metacello: ' , ConfigurationOfMetacello project currentVersion versionNumber versionString.
glassVersion versionNumber >= versionString asMetacelloVersionNumber 
    ifTrue: [ 
        Transcript cr; show: 'GLASS up-to-date'.
	^nil].
ConfigurationOfGLASS project updateProject.
ConfigurationOfMetacello project currentVersion versionNumber < '1.0-beta.31.1' asMetacelloVersionNumber 
    ifTrue: [
        "load basic Metacello packages for version 1.0-beta.31.1. 
	 To load GLASS 1.0-beta.8.7.4:
	  - Metacello must handle symbolic versions
	  - MetacelloSkipDirtyPackageLoad needs to be defined"
	Transcript cr; show: 'load basic Metacello packages for version 1.0-beta.31.1'.
	[
	((Smalltalk at: #Gofer) new)
		gemsource: 'metacello';
		version: 'Metacello-Base-DaleHenrichs.19';
		version: 'Metacello-Core-dkh.468';
		version: 'Metacello-MC-dkh.531';
		load.
	((Smalltalk at: #Gofer) new)
		gemsource: 'metacello';
		version: 'Metacello-Platform.gemstone-dkh.23';
		load ]
                        on: Warning
                        do: [:ex |
                                Transcript cr; show: 'Warning: ', ex description.
                                ex resume: true ].
	(Smalltalk at: #MetacelloGemStonePlatform) initialize ].
[
Transcript cr; show: (Smalltalk at: #MetacelloPlatform) current printString.
	[
	(ConfigurationOfGLASS project version: versionString) load: #( 'Core' 'Monticello' 'Gofer Project Loader' ).
	(ConfigurationOfGLASS project version: versionString) load ]
		on: (Smalltalk at: #MetacelloSkipDirtyPackageLoad) 
		do: [:ex | ex resume: false ]]
	on: Warning
	do: [:ex |
		Transcript cr; show: 'Warning: ', ex description.
		ex resume: true].

