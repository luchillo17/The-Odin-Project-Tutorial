def case_word(s)
	case s[0...3]
	when /^\S*qu/
		n = s.match(/^\S*qu/)[0].length
		s=s[n..-1]+s[0...n]
	when /^[^aeiou]{3}/
		s=s[3..-1]+s[0..2]
	when /^[^aeiou]{2}/
		s=s[2..-1]+s[0...2]
	when /^[^aeiou]{1}/
		s=s[1..-1]+s[0]
	end
	s=s+'ay'
end

def translate(str)
	return case_word(str) if !(str.include?(' '))
	str = str.split
	str.collect! do |s|
		case_word(s)
	end
	puts str
	str.join(' ')
end

