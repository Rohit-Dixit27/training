
#Given two strings s and t,return true if t is an anagram of s,and false otherwise.
	

	def check_anagram(s,t)
	slen=s.length
	tlen=t.length
	hash1={}
	hash2={}
	 for i in 0...slen do
	 if hash1.key?(s[i])
	 hash1[s[i]]+=1
	 else
	 hash1[s[i]]=1
	 end
	 end
	 for i in 0...tlen do
	 if hash2.key?(t[i])
	 hash2[t[i]]+=1
	 else
	 hash2[t[i]]=1
	 end
	 end
	 if hash1==hash2
	 return true
	 else
	 return false
	 end
	 end
 
  
 s="knee"
 t="neek"
 result=check_anagram(s,t)
 puts result
 

