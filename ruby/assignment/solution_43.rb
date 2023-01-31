=begin
	Write a function that,given a date(in the format MM/DD/YYYY),returns the day of the week as a string.
	Each day name must be one of the following strings: "sunday","monday","tuesday","wednesday","thursday","friday" or "saturday".
	To illustrate,the day of the week for "12/07/2016" is "wednesday".

=end
 
 		require 'date'

		def get_day_name(d)
		d=Date.strptime(d,'%m/%d/%Y')
		puts d.strftime("%A")
		end


 d="01/20/2023"
 get_day_name(d)


