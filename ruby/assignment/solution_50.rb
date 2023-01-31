=begin
	If today was Monday, in two days, it would be Wednesday.
	Create a function that takes in an array of days as input and the number of days to increment by. Return an
	array of days after n number of days has passed.
	after_n_days(["Thursday", "Monday"], 4) ➞ ["Monday", "Friday"]

=end
		def check_day(arr,n)
			hash={"Monday"=>1,"Tuesday"=>2,"Wednesday"=>3,"Thursday"=>4,"Friday"=>5,"Saturday"=>6,"Sunday"=>7}

			day=0
			result=[]
			arr.each do |i|
			day=hash[i]+n


			if day>7
			day=day-7
			end

			hash.each do |key,value|
			if day==value
			result.push(key)
			end
			end
			end

			return result
			end


 print check_day(["Thursday","Monday"], 4)



