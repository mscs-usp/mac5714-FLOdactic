accessing
catalogCard
	"Prints on the Transcript the catalog card of the didactic material"
	"Reference: http://www.biblioteca.bauru.unesp.br/?_escaped_fragment_=/servicos/ficha-catalografica/"
	| authorsData counter |

	authorsData := ''.	
	authors = nil ifFalse: [
		authors do: [ :author | Transcript show: author name; crlf ].
		Transcript tab; show: title, ', ', modified year; crlf.
		counter := 0.
		tags do: [ :tag | counter := counter+1.
			Transcript show: counter printString, '. ', tag name; space ].
		Transcript crlf.
		Transcript crlf.
	]
