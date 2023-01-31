=begin
	Given a range of years as a string, return the number of leap years there are within the range (inclusive).
	
=end

		require 'date'
		def get_leap_year(str)
			count=0
			str=str.split("-")
			str[0].upto(str[1]) do |d|
			date=Date.new(d.to_i)
			if date.leap?
				count+=1
			end
			end
			return count
			end
 str="2001-2010"
 result=get_leap_year(str)
 print result


