# Libros: Elementos de referencia de un libro completo:
# Autor, A. A. (Ano de publicación). Título del libro: Mayúscula inicial también para el
# subtítulo (edición) (volumen). Lugar de publicación: editor o casa publicadora.

# Artículo: Para un artículo o capítulo dentro de un libro editado:
# Autor, A. A. & Autor, B. B. (A˜no de publicación). T´ıtulo del artículo o capítulo. En A.
# Editor & B. Editor (Eds.), Título de la obra (números de páginas del cap´ıtulo) (edici´on)
# (volumen). Lugar de publicaci´on: editor o casa publicadora.

# Artículo de periódico:
# Autor, A. A. (Fecha mostrada en la publicación). Título del artículo. Nombre del periódico,
# pp. números de páginas.

# Documentos electrónicos:
# Autor/responsable (fecha de publicaci´on). Título (edición), [tipo de medio]. Lugar de publicación:
# editor. Disponible en: especifique la vía [fecha de acceso].

require "prct10/reference"
require "prct10/linkedList"
require "prct10/book"
require "prct10/magazinearticle"
require "prct10/journalarticle"
require "prct10/electronicdocument"

class APA

	def initialize()
		@lista = LinkedList.new
		@sufijo = 0
	end
	
	def insert(reference)
		raise ArgumentError, "La referencia no es de tipo referencia" unless reference.kind_of?(Reference)
		
		# Renombramos los autores para ordenar bien
		str = ""
		reference.authors.each do |a|
			# raise ArgumentError, "Uno de los autores no es un string" unless a.is_a?(String)
			# raise ArgumentError, "Se especifica unicamente el nombre o el apellido" unless a.split(' ').length > 1
			element = a.split(/\W+/)
			str+=element[1]
			str+=", "
			unless element[2].nil?
				str+=element[2][0]
				str+="."
			end
			str+=element[0][0]
			str+="."
			str+=" & " unless a == reference.authors.last
		end
		reference.authors = str
		@lista.insert_by_end(reference)
	end
	
	def each
		@lista.each{ |i| yield i}
	end
		
	def to_s
		authorsPrev = ""
		datePrev = ""
		listSort = @lista.sort
		string = ""
		listSort.each do |i|
			if (i.instance_of? Book)
				
				# Autores APA
				string += i.authors
			
				# Año de publicacion APA
				element = i.date.split(/\//)
				string += " (#{element[2]}"
				
				
				if (i.date == datePrev &&  i.authors == authorsPrev)
					string += (@sufijo+97).chr
					string += "). "
					@sufijo += 1
        		else
        			string += "). "
				end
				authorsPrev = i.authors
				datePrev = i.date
        
				# Título APA
				string += " #{i.title.capitalize} "
				
				# Edición APA
				string += " (#{i.edition}) "
				
				# Volumen APA
				string += " (#{i.volume}). "
				
				# Editorial APA
				string += " #{i.editorial} \n\n"
			elsif (i.class.to_s == "JournalArticle")
				# Autores APA
				string += i.authors
			
				# fecha de publicacion APA
				string += " (#{i.date}"
				
				if (i.date == datePrev &&  i.authors == authorsPrev)
					string += (@sufijo+97).chr
					string += "). "
					@sufijo += 1
        		else
        			string += "). "
				end
				authorsPrev = i.authors
				datePrev = i.date
				
				# Título articuloAPA
				string += " #{i.title.capitalize}. "
				
				# Nombre periodico APA
				string += " #{i.journal}, "
				
				# Número de paginas APA
				string += " #{i.finalpage}.\n\n "
			elsif (i.class.to_s == "electronicdocument")
				# Autores APA
				string += i.authors
			
				# fecha de publicacion APA
				string += " (#{i.date}"
				
				if (i.date == datePrev &&  i.authors == authorsPrev)
					string += (@sufijo+97).chr
					string += "). "
					@sufijo += 1
        		else
        			string += "). "
				end
				authorsPrev = i.authors
				datePrev = i.date
				
				# Título articuloAPA
				string += " #{i.title.capitalize}"
				
				# Edición articuloAPA
				string += " (#{i.edition})."
				
				# Nombre periodico APA
				string += " [#{i.journal}] "
				
				# URL de paginas APA
				string += " #{i.url}.\n\n "
			end
		end
		return string
	end
end
