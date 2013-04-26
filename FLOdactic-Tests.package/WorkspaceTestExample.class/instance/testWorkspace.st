as yet unclassified
testWorkspace
	"This is not really a test, is a 'persistent workspace' in order to try it at home"

	"Specific test roadmap (working)
	
* Create an administrator and two moderators
admin := Administrator new.
admin email: 'admin@flodactic.org'; name: 'Leonardo Boiko'.

moderator01 := Moderator new.
moderator01 email: 'moderator01@flodactic.org'; name: 'Jose Rodrigues'.

moderator02 := Moderator new.
moderator02 email: 'moderator02@flodactic.org'; name: 'Leonardo Santos'.

* Create a regular user
albert := Author new: 'Albert De La Fuente'.

* Create a tag (which way?)
pythonTag := Tag new: 'python'.
tags := OrderedCollection new.
tags add: 'python';
        add: 'programming';
        add: 'ldap'.

* Create a material
didacticMaterial := DidacticMaterial new.
didacticMaterial uri: 'http://www.albertdelafuente.com/doku.php/wiki/devel/python/ldap-auth';
				 owner: albert;
				 title: 'Python LDAP authentication';
				 tags: tags.
				
* Create a regular user
igor := Author new: 'Albert De La Fuente'.

* Give permissions
	"


	"Brainstorm (Albert)
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