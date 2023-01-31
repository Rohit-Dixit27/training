
=begin
	Given an array of integers nums and an integer target,return indices of the two numbers such that they add up to target.
	You may assume that each input would have exactly one solution, and you may not use the same element twice.You can return the answer in any order.

=end

			def targeted_sum(arr,x)
				hash={}
				len=arr.length
			for i in 0...len do
				hash[arr[i]]=i
				end
			for i in 0...len do
				t=x-arr[i]
			if hash.has_key?(t) && t!=arr[i]
				return  i,hash[t]
			end
				end
			end

	arr=[3,4,2,8,7]
	x=15
	result=Array.new()
	result=targeted_sum(arr,x)
	print result


