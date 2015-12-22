require 'spec_helper'

describe Electronicdocument do
  before :each do
    @ed1 = Electronicdocument.new(["Antony","Vincent"],"publicaciones", "10/05/1980", "http://google.es")
  end
  
   # Debe existir la clase
  it "Debe existir la clase" do
		expect(@ed1).not_to be_nil
	end
  
  # Existe un método de impresión del documento electrónico.
  it 'Existe un método de impresión del documento electrónico' do
    		expect(@ed1.to_s).to eq("Antony, Vincent (10/05/1980).\npublicaciones.\nDisponible en http://google.es")
		
  end 
  
end
