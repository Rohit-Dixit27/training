=begin
	Given a date, return how many days date is away from 2023 (end date not included). date will be in mm/dd/yyyy format.

=end
		require 'date'
		def days_away_from_2023(date)
		date1=Date.strptime(date,'%m/%d/%Y')
		date2=Date.new(2023)
		days=date1-date2
		return days.to_i
			end
 date="01/01/2021"
 result=days_away_from_2023(date)
 print result


