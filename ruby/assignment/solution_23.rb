
=begin
	Given an array nums.We define a running sum of an array as running Sum[i]=sum(nums[0]...nums[i]).
	Return the running sum of nums.
=end

 	def running_sum(a)
		len=a.length
		arr=Array.new()
	 for i in 0...len do
		 sum=0
	 for j in 0..i do 
		 sum=sum+a[j]

	 end
	  arr.push(sum)
	   end
	   return arr
	   end
	   
a=[13,1,3,5,6,7]
c=Array.new()
c=running_sum(a)
print c," "


