
=begin
	Given the parameters day,month and year,return whether that date is a valid date.
	is_valid_date(35,2,2020)->false
	#February doesn't have 35 days.
	
=end
		require 'date'
		def is_valid_date(day,month,year)
		d=Date.valid_date?(year,month,day)
			return  d
		end

 result=is_valid_date(31,1,2023)
 puts result
		

