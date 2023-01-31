
=begin
	Given an array nums containing n distinct numbers in the range [0,n],return the only number in the range that is missing from the array.

=end
			def missing_number(arr)
				hash={}
				len=arr.length
			for i in 0...len do
				hash[arr[i]]=i
				end
			for i in 1..len do
				if hash.has_key?(i)
				else
				return i
				end
		       	end
			end

	arr=[4,5,1,3,2,7]
	n=7
	result=missing_number(arr)
	print "missing element :", result


