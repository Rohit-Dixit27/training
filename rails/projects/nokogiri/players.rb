
require 'nokogiri'
require 'open-uri'

data =  URI.open("https://www.cricbuzz.com/cricket-match-squads/66197/csk-vs-lsg-6th-match-indian-premier-league-2023").read
doc = Nokogiri::HTML.parse(data)

# finding headline
doc.xpath("//div[@class='cb-billing-plans-text cb-team-lft-item']/h1").each do |headline|
  puts headline.text
end

# finding footer
doc.xpath("//div[@class='cb-mr-top-10 cb-guide-item']/div").each do |footer|
  puts footer.text
end




















