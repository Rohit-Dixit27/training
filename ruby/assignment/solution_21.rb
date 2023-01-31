
=begin
	Write a function that takes an integer(less than 1000) and return an array of primes till that number.
	
=end

 		def get_prime(a)
			 c=Array.new()
		 for i in 1..a do
			 j=2
	 	while(j<=i)
	 	if i!=2 && i%j==0 
	 		break
	
		 elsif j==i-1 || i==2
		 c.push(i)
		 end
			 j+=1
		 end
		 end
			return c
		end
 a=100 
 prime_only=Array.new()
 prime_only=get_prime(a)
 print prime_only," "
 
 
