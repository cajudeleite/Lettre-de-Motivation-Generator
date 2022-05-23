require "open-uri"
require "nokogiri"

name = "Styven H"
address = "Chez moi"
city = "Ma ville"
phone = "06 12 34 56 78"
mail = "Mon mail"
today = Time.now.strftime("%d/%m/%Y")
puts "Référence de l'offre:"
reference = gets.chomp

puts "Enter company name:"
company = gets.chomp
url = "https://www.welcometothejungle.com/fr/companies/#{company}"
location = ""
area = ""
tech = []

Nokogiri::HTML(URI.open("https://www.welcometothejungle.com/fr/companies/#{company}").read).search(".fQRMlS").first(1).each do |element|
    location = element.text.strip
end

Nokogiri::HTML(URI.open("https://www.welcometothejungle.com/fr/companies/#{company}").read).search(".hnpWQM").first(1).each do |element|
    area = element.text.strip
end

# Nokogiri::HTML(URI.open("https://www.welcometothejungle.com/fr/companies/#{company}/tech").read).search(".cPfYRK").each do |element|
#     tech << element.text.strip
# end

system "clear"
puts "Fait à #{city}, le #{today}."
puts ""
puts "Objet : #{reference}"
puts ""
puts "Madame, Monsieur,"
puts ""
puts "Afin de mener à bien mes études et mes projets, je souhaite approfondir mes connaissances dans le domaine de l’informatique."
puts "#{company.capitalize} est reconnue dans le secteur de #{area}, c’est une des raisons qui ont forcément attiré mon attention. Travailler en alternance dans votre entreprise me donnerait l’opportunité de mettre en pratique mes compétences techniques ainsi que les notions étudiées et de consolider une solide expérience professionnelle."
puts ""
puts "Grâce à mes précédents projets réalisés à ETNA,  je suis conscient des exigences et des capacités requises pour développer [CE QUE L’OFFRE DEMANDE]. Sérieux et motivé, je possède les qualités d’adaptation indispensables à la réussite d’une formation en alternance."
puts ""
puts "Actuellement étudiant chez ETNA, je souhaite acquérir et mettre en pratique mes compétences. Pour être mieux préparé au métier de développeur, j’ai choisi la voie de l’alternance. C’est pourquoi je suis à la recherche d’une entreprise qui me permettrait d’allier enseignement théorique et formation pratique."
puts ""
puts "Je reste à votre disposition pour tous renseignements complémentaires ou pour fixer tout rendez-vous à votre convenance."
puts ""
puts "Veuillez agréer, Madame, Monsieur, l’expression de mes salutations distinguées."