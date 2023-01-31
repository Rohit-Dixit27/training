
=begin
	Given two strings s and part,perform the following operation on s until all occurrences of the substring part are removed.
	Find the leftmost occurrence of the substring part and remove it from s.Return s after removing all occurrences of part.
	A substring is a contiguous sequence of characters in a string.
	
=end
		def remove_part(s,part)
		len=s.length
	
		if s.match?(part)
		s.slice!(part)
		else
		end
		return s
		end

 s="we here hello"
 part="we here"
 result=remove_part(s,part)
 puts result


