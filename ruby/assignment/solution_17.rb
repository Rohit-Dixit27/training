=begin
	Write a function which takes an integer(positive) and return an array of Fibonacci number of each index in index position till given number.

=end
	def fib_array(n)
		a=0
		b=1
		arr=Array.new()
		arr.push(0)
		arr.push(1)

		(n-1).times do
			c=a+b
			a=b
			b=c
		arr.push(c)
			end
		return arr
	end


n=5
get_array=Array.new()
get_array=fib_array(n)
print get_array," "



