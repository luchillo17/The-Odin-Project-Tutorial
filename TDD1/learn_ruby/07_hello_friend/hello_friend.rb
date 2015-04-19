class Friend
	def greeting(name="")
		name=", "+name unless name == ""
		"Hello"+name+"!"
	end
end