
require 'nokogiri'
require 'open-uri'

data =  URI.open("https://www.cricbuzz.com/cricket-match-squads/66197/csk-vs-lsg-6th-match-indian-premier-league-2023/").read
object = Nokogiri::HTML.parse(data)

arr1 = Array.new();
count1=0;
object.xpath("//div[@class='cb-player-name-right']").each do |i|
  arr1.append(i.text)
  count1+=1
  if(count1>10)
    break
  end
end
puts arr1

arr2 = Array.new();
count2=0;
object.xpath("//div[@class='cb-player-name-left']").each do |i|
  arr2.append(i.text)
  count2+=1
  if(count2>10)
    break
  end
end
puts arr2



















