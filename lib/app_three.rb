require 'rubygems'
require 'nokogiri'
require 'open-uri'


# creating all the link inside the nokogiri
town_hall = Array.new
page = Nokogiri::HTML(open(­­"https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&lang=fr"))
a = page.xpath("/html/body/div[1]/main/div/div/div[1]/ul[1]/li[1]/h2")
#prendre les url.txt
a.each do |url|
  town_hall << url.text
end
puts town_hall