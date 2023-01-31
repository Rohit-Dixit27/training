
	
#Create a function that takes an array of strings and integers,and filters out the array so that it returns an array of integers only.
	
		def get_int(arr)
			filter_arr=[]
			filter_arr=arr.select{|e| e.is_a?(Integer)}
		return filter_arr
		end

	arr=[1,2,3,"hi","hello"]
	filter_arr=[]
	filter_arr=get_int(arr)
	print filter_arr
