require 'nokogiri'
require 'open-uri'
require 'rubygems'

def town_hall_email
  # creating all the link inside the nokogiri
  town_hall = []
  page = Nokogiri::HTML(open(­­"http://annuaire-des-mairies.com­/­val-d-oise.html")) 
  a = page.xpath('//­­a[@class="lientxt"]/­­@href')
  #prendre les url.txt
  a.each do |url|
    town_hall << url.text
  end
  town_hall_url = town_hall
    #initialisation des tableau
    emails = []
    town_name = []
    tabhash = {}
    town_hall_url.each do |town|
      page = Nokogiri::HTML(open(­­"http://annuaire-des-mairies.com/#{town}")) 
      page.xpath('///­­tr[@class="txt-prima­r­y tr-last"]/­­td[2]').select do |email| #prendre les td incluant @(les emails)
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
town_hall_email
