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
require "prct11/journalarticle"

class DSLBook < Book
    
    def initialize(&block)
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


class DSLJournal < JournalArticle
    
    def initialize(&block)
        self.title = []
        self.date = []
        self.number = []
        self.volume = []
        self.initpage =[]
        self.finalpage = []
        self.authors = []
        self.title = ""
        self.journal = []
        instance_eval(&block)
    end
    
    def title_(titles)
        self.title = titles
    end
    
    def author(author)
        self.authors = author
    end
    
    def journalarticle (datos = {})
      self.title = datos[:nombre]
       self.journal = datos[:periodico]
       self.date  = datos[:fecha]
       self.number = datos[:numero]
       self.volume = datos[:volumen]
       self.initpage = datos[:paginicio]
       self.finalpage = datos[:pagfinal]
    end
end