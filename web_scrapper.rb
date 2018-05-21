require 'rubygems'
require 'nokogiri'
require 'csv'
require 'open-uri'
require 'pry'
require 'HTTParty'
require 'JSON'

page = HTTParty.get('http://www.amsterdammade.org/makers/')
nokogiri_page = Nokogiri::HTML(page)
items_name = []
items_url = []


nokogiri_page.css('a.maker-item').each do |item|
  item_name = item.text.strip
  items_name.push(item_name)
  url_name = item.attribute('href').value
  items_url.push(url_name)
end
puts items_name
puts items_url


CSV.open('advantica_companies.csv', 'w') do |csv|
  csv << items_name
end
