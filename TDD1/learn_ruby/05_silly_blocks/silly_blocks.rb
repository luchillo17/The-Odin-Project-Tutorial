 def reverser
 	str=yield
 	str.split.collect{|s| s.reverse!}.join(' ')
 end

 def adder(num=1)
 	n=yield
 	n+num
 end

 def repeater(n=1)
 	n.times{yield}
 end