class Reference
	include Comparable
 	attr_accessor :title, :date, :authors

 	
	def initialize(authors, title, date)
	    self.authors = []
	    authors.each do |palabras|
	       	@authors.push(palabras)
	    end
	        @title = title
	        @date = date
	end
	
	def get_title
		@title
	end
	
	def <=>(other)
      return nil unless other.is_a? Reference
      if authors == other.authors then
      	if date == other.date
      		title <=> other.title
      	else 
      		date <=> other.date
      	end
      else
      	authors <=> other.authors
      end
	end


end