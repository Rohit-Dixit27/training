

=begin
	Write a function which takes square matrix mat,return the sum of the matrix diagonals.
	Only include the sum of all the elements on the primary diagonal and all the elements on the secondary diagonal that are not part of the primary diagonal.

=end

		def diagonal_sum(a)
			sum=0
			n=a.count
			for i in 0...n do
			for j in 0...n do
				if i==j
				sum=sum+a[i][j]
				end

			end
			end

				sum1=0
			for i in 0...n do
			for j in 0...n do
				if ((i+j)==n-1) && (i!=j)
				sum1=sum1+a[i][j]
				end
			end
			end
			return sum+sum1
			end

a=[[1,2,3],[4,5,6],[7,8,9]]
total=diagonal_sum(a)
print "sum of diagonal: ",total


