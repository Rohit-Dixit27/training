
=begin
	Given an integer array nums and an integer k,return the number of pairs(i,j) where i<j such that
	|nums[i]-nums[j]| == k.
	
=end

	def get_pairs(a,k)
		 len=a.length
		 count=0
	 for i in 0...len-1 do
	 for j in i+1...len do
		 if a[i]-a[j]==k
		 count+=1
	 end
	 end
	 end
	 return count
	end

a=[7,5,3,1,2,0]
k=2
total=get_pairs(a,k)
print "total number of pairs are:#{total}"


