
#Given a string s,reverse only all the vowels in the string and return it.The vowels are 'a','e','i','o','u',and they can appear in both cases.


		def reverse_vowels(str)
			len=str.length
		for i in 0...len-1 do
		for j in i+1...len do
			   if str[i].match?(/[aeiouAEIOU]/)&&str[j].match?(/[aeiouAEIOU]/)
			   temp=str[i]
       		str[i]=str[j]
   			str[j]=temp
  			end
  			end
  			end
  			return str
  			end
  
 str="cretA"
 result=reverse_vowels(str)
 puts result



