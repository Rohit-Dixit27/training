
=begin
	Given a string s,return true if s is a good string,or false otherwise.
	A string s is good if all the characters that appear in s have the same number of occurrence(i.e., the same frequency).
	
=end
	def good_string(string)
		h={}
		len=string.length
		for i in 0...len do

		if h.has_key?(string[i])
			h[string[i]]+=1
			else
		h[string[i]]=1
			end
			end
			check=h[string[0]]
		if h.values.all?(check)
			return 'true'
			else
		return 'false'
		end
			end



string="toot"
result=good_string(string)
print result



