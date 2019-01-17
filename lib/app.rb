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
  # create the array of symbol
  symbolic = Array.new
  symbole.each do |txt|
    symbolic << txt.text
  end
  # The hash of the prices and the symbol
  new_array = Array.new
  table = Hash.new
  table = Hash[symbolic.zip(prix)]
  new_array.push(table)
  return new_array
end
puts all_bitcoin(symbole, price)
