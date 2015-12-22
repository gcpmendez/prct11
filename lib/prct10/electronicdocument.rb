class Electronicdocument < Regularpublications
    
	def initialize(authors, title, date, url)
		super(authors, title, date)
		@url = url
	end
	
	def to_s()
		string = ""
        for i in (0..@authors.size-1)
    	    string += "#{authors[i]}"
            if (i != @authors.size-1)
                string += ", " 
            end
        end
		string += " (" + date + ").\n"
		string += title
		string += ".\nDisponible en " + @url
	end
end