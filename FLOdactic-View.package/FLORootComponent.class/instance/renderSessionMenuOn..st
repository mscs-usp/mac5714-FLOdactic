as yet unclassified
renderSessionMenuOn: html
	html unorderedList class: 'nav pull-right'; with: [
		self session isLoggedIn ifTrue: [
			html listItem with: [
				html anchor
					useBaseUrl;
					callback: [ currentPage := FLOEditUserTask new ];
					extraPath: (self pathFor: 'edituser');
					with: [
						html html: '<i class="icon-user"></i> '.
						html text: self session facade loggedUser username ] ].
			html listItem with: [
				html anchor
					useBaseUrl;
					callback: [
						self session facade doLogout.
						currentPage := defaultPage new ];
					extraPath: (self pathFor: defaultPage title);
					with: [
						html html: '<i class="icon-off"></i> '.
						html text: 'Sign out' ] ] ]
		ifFalse: [
			html listItem with: [
				html anchor
					useBaseUrl;
					callback: [ currentPage := FLOUserSignOnComponent new ];
					extraPath: (self pathFor: 'signon');
					with: 'Sign on' ].
			html listItem with: [
				html anchor
					useBaseUrl;
					callback: [ currentPage := FLOUserSignUpTask new ];
					extraPath: (self pathFor: 'signup');
					with: 'Sign up' ] ] ]