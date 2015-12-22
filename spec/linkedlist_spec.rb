require 'spec_helper'

describe LinkedList do
  before :each do
    @book1=Book.new("Programming Ruby 1.9 &2.0: The Pragmatic Programmers Guide","Pragmatic Bookshelf", 4,"07/07/2013",["978-1937785499","1937785491"], ["Dave Thomas","Andy Hunt","Chad Fowler"],"The Facets of Ruby")
    @book2=Book.new("Pro Git 2009th Edition","Apress", 2009,"27/08/2009",["978-1430218333","1430218339"], ["Scott Chacon"],"Pro")
    @book3=Book.new("The Ruby Programming Language","O'Reilly Media",1,"04/02/2008",["978-0596516178","0596516177"],["David Flanagan","Yukihiro Matsumoto"], 4)
    @book4=Book.new("The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends","Pragmatic Bookshelf", 1,"25/12/2010",["978-1934356371","1934356379"], ["David Chelimsky","Dave Astels","Bryan Helmkamp","Dan North","Zach Dennis","Aslak Hellesoy"],"The Facets of Ruby")
    @book5=Book.new("Git Pocket Guide","O’Reilly Media", 1,"02/08/2013",["978-1449325862","1449325866"], ["Richard E. Silverman"], 2)
        
    @lista = LinkedList.new
  end
  
# * Biblio *
# === Node ===
# Debe existir un Nodo de la lista con sus datos y su siguiente
  it 'Debe existir un nodo de la lista con sus datos y su siguiente' do
    @lista.insert_by_begin(@book1)
    expect(@lista.get_value).to eq(@book1)
    expect(@lista.get_next).to be nil
  end
  
# === List ===
# Se extrae el primer elemento de la lista
  it 'Se extrae el primer elemento de la lista' do
    expect{@lista.extract_by_begin()}.to raise_error(RuntimeError, "List is empty, you can't extract a node")
    @lista.insert_by_begin(@book1)
    @lista.insert_by_begin(@book1)
    @lista.insert_by_begin(@book1)
    expect(@lista.extract_by_begin().to_s).to eq("Dave Thomas , Andy Hunt , Chad Fowler.\nProgramming Ruby 1.9 &2.0: The Pragmatic Programmers Guide.\nThe Facets of Ruby.\nPragmatic Bookshelf; 4 Edition (07/07/2013).\nISBN 14: 978-1937785499.\nISBN 10: 1937785491.")
  end 
  
# Se puede insertar un elemento
  it 'Se puede insertar un elemento' do
    @lista.insert_by_end(@book1)
    expect(@lista.size).to eq 1
    @lista.insert_by_end(@book1)
    @lista.insert_by_end(@book1)
    expect(@lista.size).to eq 3
  end 
  
#  Se pueden insertar varios elementos
  it 'Se pueden insertar varios elementos' do
    @lista.insert_set([@book1,@book2,@book3,@book4,@book5])
    expect(@lista.size).to eq 5
  end 
  
# Debe existir una Lista con su cabeza
  it 'Debe existir una Lista con su cabeza' do
    expect(@lista).not_to be_nil
    @lista.insert_by_end(@book1)
    expect(@lista.get_value).not_to be nil
  end 

end
