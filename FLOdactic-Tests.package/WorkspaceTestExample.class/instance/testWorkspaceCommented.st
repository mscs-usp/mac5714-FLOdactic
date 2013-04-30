as yet unclassified
testWorkspaceCommented
	"This is not really a test, is a 'persistent workspace' in order to be able to use it over git"
"
admin := User new.
admin username: 'admin'; password: 'q'; name: 'Leonardo Santos'; email: 'admin@flodactic.org'; role: 'administrator'; status: 'enabled'.
mod01 := User new.
mod01 username: 'mod01'; password: 'q'; name: 'Rodolpho Bustamante'; email: 'mod01@flodactic.org'; role: 'moderator'; status: 'enabled'.
mod02 := User new.
mod02 username: 'mod02'; password: 'q'; name: 'Rodolpho Bustamante'; email: 'mod02@flodactic.org'; role: 'moderator'; status: 'enabled'.

albert := User new.
albert username: 'vonpupp'; password: 'q'; name: 'Albert De La Fuente'; email: 'albert@ime.usp.br'; role: 'user'; status: 'enabled'.

igor := User new.
igor username: 'topcin'; password: 'q'; name: 'Igor Topcin'; email: 'topcin@ime.usp.br'; role: 'user'; status: 'enabled'.

userManager := UserManager new.
userManager add: mod01.
userManager add: mod01.
userManager add: mod02.
userManager add: albert.
userManager add: igor.

* Create a tag (which way?)
pythonTag := Tag new: 'python'.
ldapTag := Tag new: 'LDAP'.
programmingTag := Tag new: 'programming'.
tagsManager := TagsManager new.

* Create a material
didacticMaterial := DidacticMaterial new.
didacticMaterial uri: 'http://www.albertdelafuente.com/doku.php/wiki/devel/python/ldap-auth';
				 owner: albert;
				 title: 'Python LDAP authentication';
				 tags: tags.


* Brainstorm inicial (Albert)
documento := Material new.
documento url: 'http://www.ex.com/doc.pdf' titulo: 'tutorial de Smalltalk'...
tags := ListaTags new.
tags adicionar: 'squeak' adicionar: 'desenvolvimento' adicionar: 'programacao orientada a objetos'
ca := ControleAcesso new.
ca usuario: albert material: documento permissao: modificacao receptor: albert

tags := ListaTags new.
tags adicionar: 'squeak'
busca := Buscar new.
busca usuario: albert chave: 'manual de smalltalk' tags: tags

igor := Usuario new.
igor email: 'igortopcin@gmail.com' nome: 'Igor' sobrenome: 'Topcin' senha: '1234'
usuarios := ListaUsuarios new. (herda de Collection ou List por exemplo)
usuarios adicionar: igor

sessao...

ca usuario: albert material: documento permissao: modificacao receptor: igor
documento titulo: 'tutorial de Squeak'
log acao: modificao material: documento campo: titulo por: igor no: dia

"