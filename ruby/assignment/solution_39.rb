=begin
	Given two unsorted arrays A of size N and B of size M of distinct elements,the task is to find all pairs from both arrays whose sum is equal to x.
	
=end
		def get_pairs(arr1,arr2,x)
			hash={}
			c=Array.new()

		len1=arr1.length
		len2=arr2.length
		for i in 0...len1 do
			 hash[arr1[i]]=i
			end 
		 for i in 0...len2 do
			 diff=x-arr2[i]
			 if hash[diff]
		 c.push(arr1[hash.fetch(diff)],arr2[i])
		 end
			 end
			 return c
		 end
 
arr1=[4,1,0,2,8]
arr2=[3,5,1,2,9]
x=6
result=get_pairs(arr1,arr2,x)
print " pairs are: ",result, " "
	
