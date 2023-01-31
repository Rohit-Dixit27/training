
=begin
	Given an integer array nums,move all the even integers at the beginning of the array followed by all the odd integers.Return any array that satisfies this condition.

=end

		def even_odd(a)
		len=a.length
		arr=Array.new()
		for i in 0..len-1 do
		 if a[i]%2==0
 		arr.push(a[i])
 		end
 		end
 
 		for i in 0..len-1 do
 		c=arr.include?(a[i])
 		if c==false
 		arr.push(a[i])
 		end
 		end
 		return arr
	 	end
 
	a=[2,3,5,6,8,7] 
	even_first=Array.new()
	even_first= even_odd(a)
	print even_first," "


