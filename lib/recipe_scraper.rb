require 'nokogiri'
require 'restclient'



recipe_url = "https://cooking.nytimes.com/recipes/12874-sauteed-kale?action=click&module=Collection%20Page%20Recipe%20Card&region=Our%2010%20Most%20Popular%20Easter%20Recipes&pgType=collection&rank=2"
html = RestClient.get(recipe_url)
doc = Nokogiri::HTML(html)

doc.css(".recipe-ingredients li").each do |i|
  puts i.css(".quantity").text
  puts i.css(".ingredient-name").text
end
