

#Given a string S,print all permutations of a given string.
	


			def permutation_string(str,s,e)

				if (s==e)
				puts str
				else
					i=s
				while (i<=e)
				temp=str[s]
				str[s]=str[i]
				str[i]=temp

			permutation_string(str,s+1,e)
				temp=str[s]
				str[s]=str[i]
				str[i]=temp

				i+=1
				end
				end
				end
 str="ABC"
 n=str.length
 permutation_string(str,0,n-1)



