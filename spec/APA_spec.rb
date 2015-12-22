require "spec_helper"

describe APA do
	before :each do
		@apa = APA.new
    	@book = Book.new("Don Quijote","Anaya", 4,"10/05/1980",["1234567890","123789456"], ["Cervantes Liante","Erik Dalmeida"], 2)
    	@book2 = Book.new("Miguel de Unamuno","Catedra", 2,"11/08/1990",["1234567890","123789456"], ["Mario Auan Valdes"],3)
    	@book3 = Book.new("La vida es sueño","Catedra", 3,"10/01/1983",["1234567890","123789456"], ["Ciriaco Moron Arroyo"],1)
	end
	
	it "Comprobar que existe APA" do
		expect(APA).to be_kind_of(Object)
		expect(@apa).to be_kind_of(APA)
	end
	
#   Los nombres de los autores están invertidos (apellidos, nombre); proporcione el apellido y
#       las iniciales de todos los autores de un trabajo en particular.
	it "Nombres autores invertidos (apellidos, nombre) según APA" do
		@apa.insert(@book)
		@apa.insert(@book2)
		@apa.insert(@book3)
		str = @apa.to_s.split(/\(/)
		expect(str[0]).to eq("Auan, V.M. ")
		
	end
	
# Las entradas de la lista de referencias debe estar en orden alfabético de acuerdo a los
# 	apellidos del primer autor de cada trabajo.
	it "La lista de referencias ordenada según APA" do
		@apa.insert(@book)
		@apa.insert(@book2)
		@apa.insert(@book3)
    	 expect(@apa.to_s).to be == "Auan, V.M. (1990).  Miguel de unamuno  (2)  (3).  Catedra \n\nLiante, C. & Dalmeida, E. (1980).  Don quijote  (4)  (2).  Anaya \n\nMoron, A.C. (1983).  La vida es sueño  (3)  (1).  Catedra \n\n"
	end

# Si tiene más de un artículo del (los) mismo autor(es) (referencias de un autor solo o referencias
# de múltiples autores con exactamente los mismos autores en exactamente el mismo
# orden de aparición) ordene de acuerdo al ano de publicación, comenzando con el más antiguo.
	it "Más de un artículo del (los) mismo autor(es) APA" do
	 	@journalArticle = JournalArticle.new(["Vincent asd"],"exclusiva enero","10/05/1980","hola!", 4,1, 0, 10)
	 	@journalArticle1 = JournalArticle.new(["Vincent asd"],"exclusiva enero","10/05/1987","hola!", 4,1, 0, 10)
	 	@journalArticle2 = JournalArticle.new(["Vincent asd"],"exclusiva enero","10/05/1983","hola!", 4,1, 0, 10)
	 	@apa.insert(@journalArticle)
	 	@apa.insert(@journalArticle1)
	 	@apa.insert(@journalArticle2)
 	

      	expect(@apa.to_s).to be == "asd, V. (10/05/1980).  Exclusiva enero.  hola!,  10.\n\n asd, V. (10/05/1983).  Exclusiva enero.  hola!,  10.\n\n asd, V. (10/05/1987).  Exclusiva enero.  hola!,  10.\n\n "	
	end

# Cuando un autor aparezca tanto como un autor solo y, en otra cita, como el primer autor
# de un grupo, liste primero las entradas de un autor.
	it "Autor solo y primer autor APA" do
	 	@journalArticle = JournalArticle.new(["Vincent asd", "Lucas fonde"],"exclusiva enero","10/05/1980","hola!", 4,1, 0, 10)
	 	@journalArticle1 = JournalArticle.new(["Vincent asd"],"exclusiva enero","10/05/1987","hola!", 4,1, 0, 10)
	 	@journalArticle2 = JournalArticle.new(["Vincent asd"],"exclusiva enero","10/05/1983","hola!", 4,1, 0, 10)
	 	@apa.insert(@journalArticle)
	 	@apa.insert(@journalArticle1)
	 	@apa.insert(@journalArticle2)
 	
      	expect(@apa.to_s).to be == "asd, V. (10/05/1983).  Exclusiva enero.  hola!,  10.\n\n asd, V. (10/05/1987).  Exclusiva enero.  hola!,  10.\n\n asd, V. & fonde, L. (10/05/1980).  Exclusiva enero.  hola!,  10.\n\n "	
	end
	
# Si está usando más de una referencia del mismo autor (o el mismo grupo de autores listados
# en el mismo orden) publicados en el mismo a˜no, organ´ıcelos en la lista de referencias
# alfab´eticamente de acuerdo al t´ıtulo del art´ıculo o del cap´ıtulo. Entonces asigne letras al
# ano como sufijos. Cuando se refiera a estas publicaciones en su escrito utilice las letras de
# sufijos con el a˜no para que el lector sepa a cu´al referencia se est´a refiriendo.
	it "Sufijos APA" do
	 	@journalArticle = JournalArticle.new(["Vincent asd"],"exclusiva enero","10/05/1980","hola!", 4,1, 0, 10)
	 	@journalArticle1 = JournalArticle.new(["Vincent asd"],"exclusiva enero","10/05/1980","hola!", 4,1, 0, 10)
	 	@journalArticle2 = JournalArticle.new(["Vincent asd"],"exclusiva enero","10/05/1980","hola!", 4,1, 0, 10)
	 	@journalArticle3 = JournalArticle.new(["Vincent asd"],"exclusiva enero","10/05/1983","hola!", 4,1, 0, 10)
	 	@apa.insert(@journalArticle)
	 	@apa.insert(@journalArticle1)
	 	@apa.insert(@journalArticle2)
	 	@apa.insert(@journalArticle3)
 	
      	expect(@apa.to_s).to be == "asd, V. (10/05/1980).  Exclusiva enero.  hola!,  10.\n\n asd, V. (10/05/1980a).  Exclusiva enero.  hola!,  10.\n\n asd, V. (10/05/1980b).  Exclusiva enero.  hola!,  10.\n\n asd, V. (10/05/1983).  Exclusiva enero.  hola!,  10.\n\n "	
	end

# Utilice & en lugar de ’y’ [o de ’and’ en las versiones en inglés] cuando liste varios autores
# de un solo trabajo.
	it "& listando varios autores APA" do
		@journalArticle = JournalArticle.new(["Vincent asd", "Lucas Mendoza"],"exclusiva enero","10/05/1980","hola!", 4,1, 0, 10)
 		@apa.insert(@journalArticle)
		str = @apa.to_s.split(/\(/)
		expect(str[0]).to eq("asd, V. & Mendoza, L. ")
	end

# Todas las líneas después de la primera línea de cada entrada en su lista de referencias deben
# tener una sangría de media pulgada desde el margen izquierdo. Es una sangría francesa.
# Ponga en mayúsculas la primera letra de las palabras principales de los títulos de revistas
	it "Sangría y Mayúsculas APA" do
		@journalArticle = JournalArticle.new(["Vincent asd", "Lucas Mendoza"],"exclusiva enero","10/05/1980","hola!", 4,1, 0, 10)
 		@apa.insert(@journalArticle)
 		@journalArticle2 = JournalArticle.new(["Dincent asd", "Hucas Mendoza"],"exclusiva enero","10/05/1984","hola!", 4,1, 0, 10)
 		@apa.insert(@journalArticle2)
		expect(@apa.to_s).to eq("asd, D. & Mendoza, H. (10/05/1984).  Exclusiva enero.  hola!,  10.\n\n asd, V. & Mendoza, L. (10/05/1980).  Exclusiva enero.  hola!,  10.\n\n ")
	end


end