
=begin

	You are given an array of strings nums and an integer k.Each string in nums represents an integer without leading zeros.
	Return the string that represents the kth largest integer in nums.
	Note:-Duplicate numbers should be counted distinctly.For example,
	if nums is ["1","2","2"], "2" is the first largest,"2" is the second largest and "1" is the first largest. 
	
=end
		def largest_number(arr,n)

			len=arr.length
			for i in 0...len do
			arr[i]=arr[i].to_i
			end
			arr=arr.sort!
			arr=arr.reverse!
			for i in 0...len do
			if i==(n-1)
			return arr[i]
			end
			end
			end
			
 arr=["1","2","2","3","2","4","5"]
 n=6
 result=largest_number(arr,6)
 puts result


