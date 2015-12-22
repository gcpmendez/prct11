require 'spec_helper'

describe Comparable do
  before :each do
     @Book1 = Book.new("Don Quijote","Anaya", 4,"10/05/1980",["1234567890","123789456"], ["Cervantes","Y otro"],"Históricos españoles")
     @ref1 = Reference.new(["Dervantes","Y otro","asdf"],"Non Quijote", "20/05/1980")
  end
  
    it "ref1 ('Don Quijote') < ref2 ('Non Quijote')? TRUE (orden alfabético)" do
      expect(@Book1 < @ref1).to eq(true)
    end
    it "ref1 ('Don Quijote') > ref2 ('Non Quijote')? FALSE (orden alfabético)" do
      expect(@Book1 > @ref1).to eq(false)
    end
    it "ref1 ('Don Quijote') <= ref2 ('Non Quijote')? TRUE (orden alfabético)" do
      expect(@Book1 <= @ref1).to eq(true)
    end
  
    it "ref1 ('Don Quijote') == ref2 ('Non Quijote')? FALSE (orden alfabético)" do
      expect(@Book1 == @ref1).to eq(false)
    end
end