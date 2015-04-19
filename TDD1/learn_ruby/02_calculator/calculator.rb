def add x,y
	x+y
end

def subtract x,y
	x-y
end

def sum arr
	arr[0]||=0
	
	arr.inject(:+)
end

def multiply(*num)
	num.inject(:*)
end

def power(x,y)
	x**y
end

def factorial(n)
	n=1 if n==0
	(1..n).inject(:*)
end