
	#A phrase is a palindrome if,after converting all uppercase letters into lowercase letters and removing all numeric characters,it reads the same forward and backward.
	#Alphanumeric characters include letters and numbers.Given a string s ,return true if it is a palindrome,or false otherwise

	def str_palindrome(str)
       	len=str.length

		str.gsub!(/[^0-9A-Za-z]/, '')
		str.downcase!

		str1=str.reverse!
	if str==str1
	return true
		else
		return false
		end
		end

 str="abc%^&*cBa"
 result=str_palindrome(str)
 print result


