=begin
	Given the month and year as numbers, return whether that month contains a Friday 13th.
	
=end
		require 'date'
		def contain_friday13(year,month)
 
		 if Date.new(year,month,13).friday?
		 return true 
		 else 
		 return false
		 end
		 end
 
 month=10
 year=2023
 result=contain_friday13(year,month)
 print result


