# http://ruby-doc.org/core-2.2.3/Enumerable.html
describe Enumerable do
    before :each do
        @ref1=["Programming Ruby 1.9 &2.0: The Pragmatic Programmers Guide","Pragmatic Bookshelf", 4,"07/07/2013",["978-1937785499","1937785491"], ["Dave Thomas","Andy Hunt","Chad Fowler"],"The Facets of Ruby"]
        @ref2=["Pro Git 2009th Edition","Apress", 2009,"27/08/2009",["978-1430218333","1430218339"], ["Scott Chacon"],"Pro"]
        @ref3=["The Ruby Programming Language","O’Reilly Media",1,"04/02/2008",["978-0596516178","0596516177"],["David Flanagan","Yukihiro Matsumoto"]]
        @ref4=["The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends","Pragmatic Bookshelf", 1,"25/12/2010",["978-1934356371","1934356379"], ["David Chelimsky","Dave Astels","Bryan Helmkamp","Dan North","Zach Dennis","Aslak Hellesoy"],"The Facets of Ruby"]
        @ref5=["Git Pocket Guide","O’Reilly Media", 1,"02/08/2013",["978-1449325862","1449325866"], ["Richard E. Silverman"]]
        @ref6=["Los Fundamentos de Ruby","Internet","www.lpp.org","02/08/2013", ["Yo mismo"]]
        @list = LinkedList.new
        @list2 = LinkedList.new
        @list.insert_set([@ref1,@ref2,@ref3,@ref4,@ref5])
        @list2.insert_set([@ref5,@ref6])
    end
    
    it "Los elementos de la LinkedList pueden mostrarse enumerados por un each" do
        cadena = ""
        @list.each do |node|
            cadena= cadena + "#{node.to_s},"
        end
        expect(cadena).to be == "#{@ref1.to_s},#{@ref2.to_s},#{@ref3.to_s},#{@ref4.to_s},#{@ref5.to_s},"
    end
        
    it "Testeando el método count en una linkedlist" do
      expect(@list.count).to eq(5)
    end
        
    it "Testeando el max: El título mayor es 'The Ruby Programming Language'" do
      expect(@list.max[0]).to eq("The Ruby Programming Language")
    end
    
    it "Testeando el min: El título menosr es 'Git Pocket Guide'" do
      expect(@list.min[0]).to eq("Git Pocket Guide")
    end
    
    it "Testeando el all?: Todos los títulos tienen una longit mayor o igual a 3 caracteres" do
      expect(@list.all? { |word| word[0].length >= 3 }).to eq(true)
    end
    
    it "Testeando el drop: corta la LinkedList" do
      expect(@list.drop(2)[0][0]).to eq("The Ruby Programming Language")
    end
end