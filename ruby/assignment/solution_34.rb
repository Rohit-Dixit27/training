=begin
	Given two integer array nums1 and nums2,return an array of their intersection.
	Each element in the result must be unique and you may return the result in any order.
	
=end
		def get_intersection(arr1,arr2)
			hash1={}
			len1=arr1.length
			len2=arr2.length
			arr3=Array.new()
		for i in 0...len1 do
			 hash1[arr1[i]]=i
			end
		for i in 0...len2 do
			if hash1.has_key?(arr2[i]) && arr3.none?(arr2[i])
			arr3.push(arr2[i])
	
			end
		end
		return arr3
		end

nums1=[1,5,3,4,8,9,8,8]
nums2=[9,6,7,3,1,8,1]
result=Array.new()
result=get_intersection(nums1,nums2)
print result," "
	

