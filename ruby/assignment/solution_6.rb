
#Given a string s ,reverse the string without reversing its individual words.Words are separated by dots.

		def reverse_word(str)
			arr=[]
			str1=str.split(".")
			str1.reverse_each do |i|
			arr.push(i)
			end
			arr=arr.join(".")
			return arr
			end
 str="abc.def"
 result=[]
 result=reverse_word(str)
 print result
 

