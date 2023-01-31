
=begin
	Given an array nums of size n,return the majority element.The majority element is the element that appears more than [n/2] times.
	You may assume that majority element always exists in the array.
	
=end
		def calculating_majority_element(a)
			b=a.uniq
			len_b=b.length
			n=a.length
			count=Array.new(len_b,0)
			for i in 0...len_b do
		for j in 0...n do
		 if (b[i]==a[j])
			 count[i]+=1
			end
		end
			end
	for i in 0...len_b do
		if count[i]>(n/2)
	return  b[i]
		end
		end
	end

a=[3,7,3,3]
majority_element=calculating_majority_element(a)
print "majority element is :",majority_element

