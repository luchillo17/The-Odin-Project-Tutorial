def echo(word)
	word
end

def shout(word)
	word.upcase
end

def repeat(word,n=2)
	word2=word
	(n-1).times do |n|
		word2+=' '+word
	end
	word2
end

def start_of_word(s,n)
	s[0...n]
end

def first_word(s)
	s.split[0]
end

def titleize(s)
	s2 = s.split.collect{|w| w.length >4 ? w.capitalize : w}
	s2[0].capitalize!
	s2.last.capitalize!
	s2.join(' ')
end