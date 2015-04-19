def measure(n=1)
	total=0
	n.times do 
		now=Time.now
		yield 
		total+=Time.now-now
	end
	total/n
end