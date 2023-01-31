
=begin
	Given an integer limit being the upper limit of the range of intereset,implement a function that 
	returns the last 15 palindromes numbers lower or equal to limit as an array sorted ascendingly.
=end

		def get_palindrome(limit)
			arr=Array.new()
			i=limit
			while i>=0
			n=i
			m=n
			c=0
			while(n>0)
			r=n%10
			c=c*10
			c=c+r
			n=n/10
			end
		if m==c && arr.count!=15
		arr.push(m)
			end
			i-=1
			end
		arr.sort!
		return arr
		end

limit=111
show_palindrome=Array.new()
show_palindrome=get_palindrome(limit)
print show_palindrome," "


