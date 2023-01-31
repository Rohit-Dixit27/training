

=begin
	Create a function that take array of numbers and returns a new array containing only prime numbers.
	
=end
	 def get_prime(a)
	 len=a.length
	 c=Array.new()
	 for i in 0...len do
	 j=2
	 while(j<=a[i])
	 if a[i]%j==0 
	 break

	 elsif j==a[i]-1
	 c.push(a[i])
	 end
	 j+=1
	 end
	 end
	return c
	end
 a=[5,23,7,4,11,53,6,13,8] 
 prime_only=Array.new()
 prime_only=get_prime(a)
 print prime_only," "
 

 
