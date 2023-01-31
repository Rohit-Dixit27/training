=begin
	Given a string text,you want to use character of text to form as many instances of the word "balloon" as possible.
	You can use each character in text at most once.Return the maximum number of instances that can be formed.
	Example:loonballxballpoon
	You can create only 2 ballooon from example text,so return 2
	
=end
		def get_balloons(s)
			h1={'b'=>0,'a'=>0,'l'=>0,'o'=>0,'n'=>0}
			len=s.length
		for i in 0...len do
			if h1.has_key?(s[i])
			h1[s[i]]+=1
			end
			end
			h1['l']=h1['l']/2
			h1['o']=h1['o']/2

		return h1.values.min
		end


str="balbaloon"
total=get_balloons(str)
print total



