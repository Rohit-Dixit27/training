=begin
	
	Write a function which takes an array of integers,return how many of them contain an even number of digits.	
	
=end

		def even_number_digits(a)
			len=a.length
			count=0
		for i  in 0...len do
			 number=a[i]
		 while(number>0)
			 r=number%10
			 if r%2==0
			 count+=1

			 break
		 else
		 number=number/10
			 end
		end
			end
		return count
		end
		
a=[63,13,89,31,41,55]
total=even_number_digits(a)
puts " total count thats is having even number of digits: #{total}"



