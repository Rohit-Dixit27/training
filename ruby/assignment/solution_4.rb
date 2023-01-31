
#Given an n-digit large number in form of string,check whether it is divisible by 7 or not.Print 1 if divisible by 7 ,otherwise 0
	def check_divisible(str)
		n=str.to_i
		if n%7==0
		return 1
		else
		return 0
		end
	end

str="211"
puts "#{check_divisible(str)}"


