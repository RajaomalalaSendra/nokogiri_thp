require 'nokogiri'
require 'open-uri'
require 'rubygems'

# creating the page in nokogiri
page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
symbole = page.xpath('//td[@class="text-left col-symbol"]')
price = page.xpath('//a[@class="price"]')
def all_bitcoin(symbole, price)
  # creating the array of price 
  prix = Array.new
  price.each do |txt|
	  prix << txt.text
  end
  prix = prix.delete("$")
  # create the array of symbol
  symbolic = Array.new
  symbole.each do |txt|
    symbolic << txt.text
  end
  # The hash of the prices and the symbol
  table = Hash.new
  table = Hash[symbolic.zip(prix)]
  return table
end
all_bitcoin(symbole, price)
