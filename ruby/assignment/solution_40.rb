=begin
	Write a function which takes year and returns how many Saturday 14ths there are in a given year.
	
=end
		require 'date'
		def count_saturday(year)
		count=0
		i=1
		while(i<=12)
		date=Date.new(year,i,14)
		if date.saturday?
			count+=1
			end
			i+=1
		end
		return count
		end
 year=2023
 total=count_saturday(year)
 print total


