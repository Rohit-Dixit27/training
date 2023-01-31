
=begin
	Given a string s and an array of strins words,determine whether s is aprefix string of words.
	A string s is a prefix string of words if s can be made by concatenating the first k strings in words for some positive k no
	larger than words.length.Return true if s is a prefix string of words,or false otherwise.
=end
	

		def check_prefix(string,words)
			words=words.join()
			if string==words
			return true
			else
			return false
			end
		end

 string="hello"
 words=["he","llo"]
 result=check_prefix(string,words)
 print result
 

