=begin
	A panagram is a sentence where every letter of the english alphabet appears at least once.
	Given a string sentence containing only lowercase english letters,return true if sentence is a panagram,or false otherwise.
	
=end

			def check_panagram(user_str)

				original="abcdefghijklmnopqrstuvwxyz"
				hash1={}
				flag=0
				len1=original.length
				len2=user_str.length
				for i in 0...len2 do
					hash1[user_str[i]]=i
				end
				for i in 0...len1 do
					if hash1.has_key?(original[i]) 
						flag=1
					else
						flag=0 
						break
					end
					end
					if flag==1
					return true
					else
					return false
						end
					end


	user_str="abcedgfhjzilkompnqtsrvuywx"
	result=check_panagram(user_str)
	print result


