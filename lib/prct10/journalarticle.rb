# Formato de artículo del periódico:
# Autor/es
# Título del artículo.
# Título del periódico, [Volumen] (número), fecha


class JournalArticle < Regularpublications

    attr_accessor :journal, :volume, :number, :initpage, :finalpage
    
	def initialize(authorsJournal, titleJournal, dateJournal, journal, number, volumen=nil, initpage, finalpage)
		super(authorsJournal, titleJournal, dateJournal)

		@journal = journal
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
		string += @journal
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