
require 'nokogiri'
require 'open-uri'

data =  URI.open("https://www.cricbuzz.com/cricket-match-squads/66197/csk-vs-lsg-6th-match-indian-premier-league-2023").read
doc = Nokogiri::HTML.parse(data)

doc.xpath("//nav[@class='cb-nav-bar']/a").each do |nav_element|
  puts nav_element.text
end




















