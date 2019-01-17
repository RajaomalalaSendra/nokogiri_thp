require 'rubygems'
require 'nokogiri'
require 'open-uri'
#maka lien anle ville
def get_town_hall
  #initialisation du tablea town_hall dans on va y trouver apres les noms du 
  town_hall = []
  page = Nokogiri::HTML(open(­­"http://annuaire-des-mairies.com­/­val-d-oise.html")) 
  a = page.xpath('//­­a[@class="lientxt"]/­­@href')
  #prendre les url.txt
  a.each do |url|
    town_hall << url.text
  end
  #return les valeur de l'url de chaque ville de val d oise
  return town_hall
end

def town_hall_email(get_­­town_hall)
  town_hall_url = get_town_hall()
  #initialisation des tableau
  emails = []
  town_name = []
  tabhash = {}
  town_hall_url.each do |town|
    page = Nokogiri::HTML(open(­­"http://annuaire-des-mairies.com/#{town}")) 
    page.xpath('//­­tr[@class="txt-prima­r­y tr-last"]/­­td[2]').select do |email| #prendre les td incluant @(les emails)
  emails << email.text if email.text.include?(­­"@")
  end
end
 #prendre les noms des villes dans les liens de townhall 
  town_hall_url.each do |a|
    town_name << a.delete(".95/­­.html")
  end
 #convertir en hash
  return tabhash = Hash[town_name.zip(e­­mails)]
end