=begin
	Roman numerals are represented by seven different symbols:I,V,X,L,C,D and M.
	
	Symbol  value
	I         1
	V         5
	X         10
	L         50
	C         100
	D         500
	M         1000
	
	Write a functio which takes roman number and return integer corresponding to that number.
	
=end
	def getnum(key)
		hash=Hash[:I,'1',:V,'5',:X,'10',:L,'50',:C,'100',:D,'500',:M,'1000']
	
		return hash[key]
		end
	value=getnum(:V)
	print "value is :",value
	
	

