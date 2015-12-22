
class Book < Reference
    
    attr_accessor :volume, :editorial, :edition, :isbn, :authors
     
	def initialize(title,editorial,edition,date,isbn,authors, volume)
		super(authors,title,date)
		@authors = authors
        @volume = volume
        @editorial = editorial
        @edition = edition

        self.isbn = []
        isbn.each do |numeros|
            @isbn.push(numeros)
        end
        return self
	end
	
	def to_s
	   	text=""
		
	    for i in (0..@authors.size-2)
	    	 text << "#{authors[i]} , " 
	    end
	    text << "#{authors[authors.size-1]}."
	    text << "\n#{@title}."
		 text << "\n#{@volume}."
	     text << "\n#{@editorial}; #{@edition} Edition (#{@date})."
	    for i in (0..@isbn.size-1)
	    	 text << "\nISBN #{@isbn[i].length}: #{@isbn[i]}."
	    end
	    text
	end
	

end