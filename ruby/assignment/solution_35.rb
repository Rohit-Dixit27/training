
=begin
	You are given two strings of the same length s and t.In one step you can choose any character of t 
	and replace it with another character.Return the minimum number of steps to make t an anagram of s. 
	An Anagram of a string is a string that contains the same characters with a different(or the same) ordering.
=end
		def count_steps(t,s)
			h={}
			count=0
			len=t.length
			for i in 0...len do
			h[s[i]]=i
			end

		for i in 0...len do
			if h.has_key?(t[i])
			else
			t[i]=s[i]
			count+=1
			end
		end
		return count
			end

t="tgisp"
s="right"
result=count_steps(t,s)
puts "minimum number of steps are:",result


