
#write a function to return reverse of a string using recursion.
		def reverse(str)
			 if str.length==1
			 return str
			else
			 return str[-1]+reverse(str.chop)
			end
		end

 str="some"
 str2=reverse(str)
 print str2


