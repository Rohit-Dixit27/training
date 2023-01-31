
=begin
	Write a function which takes an integer(positive) and return an array of factorials of each index in index position till given number.
	
	
=end
		def factorial_array(n)
			m=n-1
			i=m
			c=[]
		c.insert(0,0)
		while m>0
			fact=1
		while i>0
			fact=fact*i
			i-=1
			end
		c.insert(m,fact)
			m-=1
			i=m

		end
		c.compact!
		return c
		end

number=5
array=Array.new()
array=factorial_array(number)
print array, " "

