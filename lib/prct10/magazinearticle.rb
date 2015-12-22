# Formato de artículo de la revista:
# Autor/es
# Título del artículo.
# Título de la revista, [Volumen] (número), fecha


class MagazineArticle < Regularpublications

    attr_accessor :magazine, :volume, :number, :initpage, :finalpage
    
	def initialize(authorsMagazine, titleMagazine, dateMagazine, magazine, number, volumen=nil, initpage, finalpage)
		super(authorsMagazine, titleMagazine, dateMagazine)

		@magazine = magazine
		@volume = volume
		@number = number
		@initpage = initpage
		@finalpage = finalpage
	end
	
	def to_s
		string = ""
        for i in (0..@authors.size-1)
    	    string += "#{authors[i]}"
            if (i != @authors.size-1)
                string += ", " 
            end
        end
		string +="\n"
		string += title
		string += ".\n"
		string += @magazine
		string += ", "
		if(!@volume.nil?)
			string += @volume.to_s
			string += " "
		end
		string += "(" + @number.to_s + ")"
		string += ", " + date
		string += "."
	end
end