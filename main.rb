require "open-uri"
require "nokogiri"
require "prawn"

Prawn::Fonts::AFM.hide_m17n_warning = true

name = "[Nom Prénom]"
female = false
address = "[Adresse]"
city = "[Ville]"
phone = "[Téléphone]"
mail = "[Mail]"
today = Time.now.strftime("%d/%m/%Y")
puts "URL de l'offre:"

url = gets.chomp
puts "Génération du PDF..."

location = ""
area = ""
tech = []
company = ""
reference = ""

def scrape(url)
  Nokogiri::HTML(URI.open(url).read)
end

scrape(url).search('.eldiLg').each do |element|
  reference = element.text.strip
end

scrape(url).search(".kgtTg").first(1).each do |element|
  company = element.text.strip
end

scrape(url).search(".fQRMlS").each do |element|
  if element.text =~ /\d/
  else
    location = element.text.strip
    break
  end
end

new_url = "https://www.welcometothejungle.com/fr/companies/#{company.downcase.gsub(" ", "-")}"

scrape(new_url).search(".hnpWQM").first(1).each do |element|
  area = element.text.strip
end

scrape(new_url + "/tech").search(".cPfYRK").first(3).each do |element|
  tech << element.text.strip
end

system "clear"

Prawn::Document.generate("lettredemotivation.pdf") do
  text name
  text address
  text city
  text phone
  text mail
  text "#{company.capitalize}"
  text "#{location.capitalize}"
  text "\n"
  text "Fait à #{city}, le #{today}."
  text "\n"
  text "Objet : #{reference}"
  text "\n"
  text "Madame, Monsieur,"
  text "\n"
  text "Afin de mener à bien mes études et mes projets, je souhaite approfondir mes connaissances dans le domaine de l’informatique."
  text "#{company.capitalize} est reconnue dans le secteur de #{area.downcase}, c’est une des raisons qui ont forcément attiré mon attention. Travailler en alternance dans votre entreprise me donnerait l’opportunité de mettre en pratique mes compétences techniques ainsi que les notions étudiées et de consolider une solide expérience professionnelle."
  text "\n"
  text "Grâce à mes précédents projets réalisés à ETNA,  je suis conscient#{"e" if female} des exigences et des capacités requises pour développer en #{tech[0]}, #{tech[1]} et #{tech[2]}. Sérieu#{female ? "se" : "x"} et motivé#{"e" if female}, je possède les qualités d’adaptation indispensables à la réussite d’une formation en alternance."
  text "\n"
  text "Actuellement étudiant#{"e" if female} chez ETNA, je souhaite acquérir et mettre en pratique mes compétences. Pour être mieux préparé#{"e" if female} au métier de développeur, j’ai choisi la voie de l’alternance. C’est pourquoi je suis à la recherche d’une entreprise qui me permettrait d’allier enseignement théorique et formation pratique."
  text "\n"
  text "Je reste à votre disposition pour tous renseignements complémentaires ou pour fixer tout rendez-vous à votre convenance."
  text "\n"
  text "Veuillez agréer, Madame, Monsieur, l’expression de mes salutations distinguées."
end

puts "Votre lettre a bien été générée !"
