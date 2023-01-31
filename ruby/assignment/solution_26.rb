
=begin
	A distinct string is a string that is present only once in an array.Given an array of strings arr,and an integer k,
	return the kth distinct string present in arr.If there are fewer than kth distinct strings,return an empty string"".

=end

	def distinct(a,k)
		len=a.length
		c=Array.new()
		d=Array.new()
	for i in 0...len do
	 for j in 0...len do
		 if a[i]==a[j] && i!=j
		 break
		  elsif j==len-1 
			  c.push(a[i])
			  end
		 end
	 end
	return c
		end
		
a=['a','e','c','a','d','f','e','f','h'] 
k=2
distinct_arr=Array.new()
distinct_arr=distinct(a,k)
 if distinct_arr.length<k+1
 puts " "
 else
 puts "distinct string at #{k} is : #{distinct_arr[k]}"
 end
 



