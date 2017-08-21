require 'open-uri'
require 'net/http'
require 'json'

# Built by LucyBot. www.lucybot.com
uri = URI("https://api.nytimes.com/svc/search/v2/articlesearch.json")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
uri.query = URI.encode_www_form({
  'api-key' => '12dae6706b9b4c0bbe47c0b902da9960',
  'fq' => 'type_of_material:Recipe',
  'facet_filter' => true,
  'fl' => 'headline,source,pub_date,lead_paragraph,word_count,_id,web_url',
  'sort' => 'newest',
  'page' => 0
})

request = Net::HTTP::Get.new(uri.request_uri)
@result = JSON.parse(http.request(request).body)
@data = @result['response']['docs']
puts @data[0]
