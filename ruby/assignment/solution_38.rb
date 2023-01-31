

=begin
	Given an array of integers nums sorted in non-decreasing order,find the starting and ending position of a given target value.
	
=end
		def location_element(arr,x)
			hash={}
			len=arr.length
		for i in 0...len do
			 hash[arr[i]]=i
		end
			if arr.include?(x)
		           return hash[x-1]+1,hash[x]
			else
			   return -1,-1
			end
			end

arr=[1,1,2,2,3,3,3,4,4,4,5,5,5]
x=5
result_arr=Array.new()
result_arr=location_element(arr,x)
print result_arr
	


