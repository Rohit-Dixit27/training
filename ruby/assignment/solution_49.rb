=begin
	The 2nd of February 2020 is a palindromic date in both dd/mm/yyyy and mm/dd/yyyy format (02/02/2020). Given a date in dd/mm/yyyy format, 
	return true if the date is palindromic in both date
         formats, otherwise return false  
=end
		require 'date'
			def date_palindrome(date)
		 
			 date=Date.strptime(date,'%d/%m/%Y')
			 date1=date.strftime('%d/%m/%Y')
			 date2=date.strftime('%m/%d/%Y')

			 if ((date1==date1.reverse)&&(date2==date2.reverse))
			 return true
			 else
 			return false
 				end

			end

 date="03/03/2020"
 result=date_palindrome(date)
 print result



