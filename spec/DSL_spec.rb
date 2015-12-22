require "spec_helper"


describe DSLBook do
    before :each do
        @DSLBook1 = DSLBook.new() do
            title   "Libro"
            author  :nombre => "Felipe Gonzalez Muniz"
            book    :nombre => "Aprende a programar desde 0 con Ruby",
                    :editorial => "Stanford",
                    :fecha => "22/12/2015",
                    :isbn => ["123789456"],
                    :volumen => 1
        end
        
        @DSLJournal1 = DSLJournal.new() do
            title_   "Periodico"
            author  :nombre => "Laura DePaz Lopez"
            journalarticle    :nombre => "DSL with Ruby",
                    :periodico => "periodico beta",
                    :fecha => "22/12/2015",
                    :numero => "1",
                    :paginicio => "1",
                    :pagfinal => "10"
        end
    end
    
    it 'Probando entrada DSLBook' do
      expect(@DSLBook1.to_s).to eq(".\nAprende a programar desde 0 con Ruby.\n1.\nStanford;  Edition (22/12/2015).\nISBN 9: 123789456.") 
    end
    
    it 'Probando entrada DSLJournal' do
       expect(@DSLJournal1.to_s).to eq("\nDSL with Ruby.\nperiodico beta, (1), 22/12/2015.") 
    end
end
