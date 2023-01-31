
=begin
	Create a function that takes time1 and time2 and return how many hours and minutes have passed
	between the two times.
	
=end
		def get_time(time1,time2)

			time1=time1.split(":")
			time2=time2.split(":")
	
		time1=Time.new(1,1,1,time1[0],time1[1],time1[2])
		time2=Time.new(1,1,1,time2[0],time2[1],time2[2])


		 hour = ((time2 - time1)/3600).to_i
		 minutes=(((time2-time1)/60)-hour*60).to_i


		return "#{hour} :#{minutes}"
		end

time1="08:00:00"
time2="10:12:00"

result=get_time(time1,time2)
print result


