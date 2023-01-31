
=begin
	Given an array of integers nums,return the number of good pairs.
	A pair (i,j) is called good if nums[i]==nums[j] and i<j.

=end
		def count(arr)
			len=arr.length
			count=0
		for i in 0...len-1 do
		 for j in i+1...len do
 
			 if arr[i]==arr[j]
				 count+=1
			 end
 
		end
			end
			return count
			end
			
arr=[1,2,1,2,4,5,3,3]
total=count(arr)
puts "number of good pairs",total





