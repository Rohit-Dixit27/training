
	#Given a string s,find the first non-repeating character in it and return its index.If it does not exist,return -1


		def non_repeating(s)
			slen=s.length
			hash1={}
		 for i in 0...slen do
			 if hash1.key?(s[i])
			 hash1[s[i]]+=1
			 else
			 hash1[s[i]]=1
			 end
		 end
			puts hash1
		if hash1.has_value?(1)
			return  hash1.key(1)
				else
			return -1
			end
			end

 s="abcddabc"
 result=non_repeating(s)
 puts result



