# article = Article.new("Ejemplo") do
#       author  :surname => "Apellido,
#               :name => "Nombre"
#       journal :name => "Titulo de la revista",
#               :volume => 20,
#               :issue => 3
#       title   "Titulo"
#       abstract "Resumen"
# end

require "prct11/book"

class DSL 
  def self.Book(&block)
    DSLBook.new(block)
  end
end

class DSLBook < Book
    attr_accessor :book
    
    def initialize(block)
        self.title = []
        self.editorial = []
        self.edition = []
        self.date = []
        self.isbn =[]
        self.authors = []
        self.volume = []
        instance_eval(&block)     
    end
    
    def title(title)
        self.title = title
    end
    
    def author(author)
        self.authors = author
    end
    
    def book (datos = {})
       self.title = datos[:nombre]
       self.editorial = datos[:editorial]
       self.edition = datos[:edicion]
       self.date = datos[:fecha]
       self.isbn = datos[:isbn]
       self.volume = datos[:volumen]
    end
    

end
