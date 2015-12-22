require 'spec_helper'

describe Book do
  before :each do
    @book1 = Book.new("Don Quijote","Anaya", 4,"10/05/1980",["1234567890","123789456"], ["Cervantes","Y otro"],"Históricos españoles")
  end
  
  # Debe existir o no un volumen.
  it 'Debe existir o no un volumen' do
    expect(@book1.volume).not_to be_empty  
  end
  
  # Debe existir una editorial.
  it 'Debe existir una editorial' do
    expect(@book1.editorial).not_to be_empty  
  end
  
  # Debe existir un número de edición.
  it 'Debe existir un número de edición' do
    expect(@book1.edition).to be > 0  
  end
  
  # Debe existir uno o más números ISBN.
  it 'Debe existir uno o más números ISBN' do
    expect(@book1.isbn.size).not_to be 0
  end
  
  # Existe un método para obtener el volumen.
  it 'Existe un método para obtener el voluemn' do
    expect(@book1).to respond_to(:volume) 
  end 
  
  # Existe un método para obtener la editorial.
  it 'Existe un método para obtener la editorial' do
    expect(@book1).to respond_to(:editorial) 
  end 
  
  # Existe un método para obtener el número de edición.
  it 'Existe un método para obtener el número de edición' do
    expect(@book1).to respond_to(:edition) 
  end 
  
  # Existe un ḿetodo para obtener el listado de ISBN.
  it 'Existe un ḿetodo para obtener el listado de ISBN' do
    expect(@book1).to respond_to(:isbn) 
  end 
  
  # Existe un ḿetodo para obtener la referencia formateada.
  it 'Existe un ḿetodo para obtener la referencia formateada' do
    expect(@book1.to_s).to eq("Cervantes , Y otro.\nDon Quijote.\nHistóricos españoles.\nAnaya; 4 Edition (10/05/1980).\nISBN 10: 1234567890.\nISBN 9: 123789456.")
  end 

end
