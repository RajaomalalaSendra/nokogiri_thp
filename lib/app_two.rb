require 'nokogiri'
require 'open-uri'
require 'rubygems'

# creating all the link inside the nokogiri
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  url = page.xpath("//a[@class='lientxt']/@href")
  # get the principal link
  link = Array.new
  url.each do |i|
    link << i.text
  end
  # get the email
  link.each do |url| 
    page_two = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{url}")) 
  a = page_two.xpath("//tr[@class='txt-primary tr-last']/td[2]")
  mail  = Array.new
    a.each do |i|
	    mail << a.text if a.text.include?("@")
    end
    puts mail.inspect
  end
