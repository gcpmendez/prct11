class DSL 
  def self.Book(&block)
    DSLBook.new(block)
  end
end

class DSLBook < Book
  def initialize(block)
    
    instance_eval(&block)
    
  end

  def author(author)
    @author = author
  end

  def book(book)
    @book = book
  end
  
  def title(title)
    @title = title
  end
end
# article = Article.new("Ejemplo") do
#       author  :surname => "Apellido,
#               :name => "Nombre"
#       journal :name => "Titulo de la revista",
#               :volume => 20,
#               :issue => 3
#       title   "Titulo"
#       abstract "Resumen"
# end
DSL = DSL.Book do
  author  :name => "Nombre"
  book    :name => "Titulo de la revista",
          :volume => 20
  title   "Titulo"
end

p DSL