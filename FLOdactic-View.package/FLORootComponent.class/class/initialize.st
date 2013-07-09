as yet unclassified
initialize
	| application |
	application := WAAdmin register: self asApplicationAt: 'flodactic'.
	application preferenceAt: #scriptGeneratorClass put: JQScriptGenerator.
	application preferenceAt: #sessionClass put: FLOSession.
	application
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: FLOBootstrapLibrary.