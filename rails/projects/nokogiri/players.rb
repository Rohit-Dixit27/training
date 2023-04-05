
require 'nokogiri'
require 'open-uri'

data =  URI.open("https://www.cricbuzz.com/cricket-match-squads/66197/csk-vs-lsg-6th-match-indian-premier-league-2023/").read
object = Nokogiri::HTML.parse(data)

player_of_team1 = Array.new();
count_team1=0;
object.xpath("//div[@class='cb-player-name-left']").each do |player|
  player_of_team1.append(player.text)
  count_team1+=1
  if(count_team1>10)
    break
  end
end
puts "Team1"
puts player_of_team1

player_of_team2 = Array.new();
count_team2=0;
object.xpath("//div[@class='cb-player-name-right']").each do |player|
  player_of_team2.append(player.text)
  count_team2+=1
  if(count_team2>10)
    break
  end
end
puts "Team2"
puts player_of_team2



















