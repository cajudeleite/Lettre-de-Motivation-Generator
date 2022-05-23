require "open-uri"
require "nokogiri"
require "prawn"

name = "Styven H"
address = "Chez moi"
city = "Ma ville"
phone = "06 12 34 56 78"
mail = "Mon mail"
today = Time.now.strftime("%d/%m/%Y")
puts "URL de l'offre:"

url = gets.chomp
location = ""
area = ""
tech = []
company = ""
reference = ""

html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.eldiLg').each do |element|
    reference = element.text.strip
end

html_doc.search(".bXdwlv").first(1).each do |element|
    newurl = "https://www.welcometothejungle.com/fr/companies/#{element.text.downcase}"
    puts "UEKF9DKF9SDF9SF9KSF9DSKF9DSKF9DS", newurl
    html_file = URI.open(newurl).read
    html_doc = Nokogiri::HTML(html_file)

    html_doc.search(".bvOGTG").first(1).each do |element|
        company = element.text.strip
    end

    html_doc.search(".fQRMlS").first(1).each do |element|
        location = element.text.strip
    end
    
    html_doc.search(".hnpWQM").first(1).each do |element|
        area = element.text.strip
    end
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
puts "Grâce à mes précédents projets réalisés à ETNA,  je suis conscient des exigences et des capacités requises pour développer #{reference.downcase}. Sérieux et motivé, je possède les qualités d’adaptation indispensables à la réussite d’une formation en alternance."
puts ""
puts "Actuellement étudiant chez ETNA, je souhaite acquérir et mettre en pratique mes compétences. Pour être mieux préparé au métier de développeur, j’ai choisi la voie de l’alternance. C’est pourquoi je suis à la recherche d’une entreprise qui me permettrait d’allier enseignement théorique et formation pratique."
puts ""
puts "Je reste à votre disposition pour tous renseignements complémentaires ou pour fixer tout rendez-vous à votre convenance."
puts ""
puts "Veuillez agréer, Madame, Monsieur, l’expression de mes salutations distinguées."

Prawn::Document.generate("lettredemotivation.pdf") do
    text "Fait à #{city}, le #{today}."
    text "\n"
    text "Objet : #{reference}"
    text "\n"
    text "Madame, Monsieur,"
    text "\n"
    text "Afin de mener à bien mes études et mes projets, je souhaite approfondir mes connaissances dans le domaine de l’informatique."
    text "#{company.capitalize} est reconnue dans le secteur de #{area}, c’est une des raisons qui ont forcément attiré mon attention. Travailler en alternance dans votre entreprise me donnerait l’opportunité de mettre en pratique mes compétences techniques ainsi que les notions étudiées et de consolider une solide expérience professionnelle."
    text "\n"
    text "Grâce à mes précédents projets réalisés à ETNA,  je suis conscient des exigences et des capacités requises pour développer #{reference.downcase}. Sérieux et motivé, je possède les qualités d’adaptation indispensables à la réussite d’une formation en alternance."
    text "\n"
    text "Actuellement étudiant chez ETNA, je souhaite acquérir et mettre en pratique mes compétences. Pour être mieux préparé au métier de développeur, j’ai choisi la voie de l’alternance. C’est pourquoi je suis à la recherche d’une entreprise qui me permettrait d’allier enseignement théorique et formation pratique."
    text "\n"
    text "Je reste à votre disposition pour tous renseignements complémentaires ou pour fixer tout rendez-vous à votre convenance."
    text "\n"
    text "Veuillez agréer, Madame, Monsieur, l’expression de mes salutations distinguées."
end