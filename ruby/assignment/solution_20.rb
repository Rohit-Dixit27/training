
=begin
	Give an unsorted array Arr of size N of positive integers.One number 'A' from set {1,2,..N} is missing and one number'B' occurs twice in array.Find these two numbers.

=end
		def missing(a,n)
			len=a.length
			sum=0
		for i in 0...len-1 do
		for j in i+1...len do
			 if a[i]==a[j]
			  number=a[i]
  				break
  				end
		end
		end
		total=(n*(n+1)/2)
		for i in 0...len do
		sum=sum+a[i]
		end
		
missing_number=total-(sum-number)
return missing_number,number
end

a=[3,5,2,4,3]
n=5
arr=Array.new()
arr=missing(a,n)


puts "missing number",arr[0]
puts "repeated number",arr[1]



