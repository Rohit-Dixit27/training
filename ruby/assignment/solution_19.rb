
=begin
	Given an integer array nums,find a contagious non-empty subarray within the array that has the largest product,and return the product.Elements can also be negative numbers.

=end
	def max_product(arr)
		i=0
		s=0
		e=0
		prod=0
		max=0
	 len=arr.length-1
		while i<len
	 prod= (arr[i])*(arr[i+1])
	 if prod>max
	 max=prod
	 s=arr[i]
 	e=arr[i+1]
 	end
 	i+=1
	end
	return s,e,max
	end

arr=[2,3,-2,4]
c=[]
c=max_product(arr)
puts "[#{c[0]},#{c[1]}] having largest product #{c[2]}"
	
	
