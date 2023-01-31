=begin
	Create a function that converts dates from one of five string formats:
	"January 9, 2019" (MM D, YYYY)
	"Jan 9, 2019" (MM D, YYYY)
	"01/09/2019" (MM/DD/YYYY)
	"01-09-2019" (MM-DD-YYYY)
	"01.09.2019" (MM.DD.YYYY)
	The return value will be an array formatted like: [MM, DD, YYYY], where MM, DD, and YYYY are all integers.
	
=end

	require 'date'
	def get_array_date(date)

	if date.match?(",")
	date=Date.parse(date)
	
	elsif date.match?("/")
	date=Date.strptime(date,'%m/%d/%Y')


	elsif date.match?("-")
	date=Date.strptime(date,'%m-%d-%Y')


	elsif date.match?(".")
	date=Date.strptime(date,'%m.%d.%Y')

	elsif date.match?(",")
	date=Date.parse(date)

	end


	 arr=[date.month,date.day,date.year]
	return arr
	end

 date="March 09,2019"
 result=get_array_date(date)
 print result
 
 
