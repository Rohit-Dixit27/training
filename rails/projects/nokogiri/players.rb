
require 'nokogiri'
require 'open-uri'

data =  URI.open("https://www.cricbuzz.com/cricket-match-squads/66197/csk-vs-lsg-6th-match-indian-premier-league-2023/").read
object = Nokogiri::HTML.parse(data)
object.xpath("//div[@class='cb-col cb-col-100']/a/div").each do |i|
  puts i.text
end
 



















