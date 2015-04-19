class Timer
	attr_accessor :seconds
	def initialize(s=0)
		@seconds=s
	end
	def time_string
		Time.at(@seconds).utc.strftime("%H:%M:%S")
	end
	def padded(t=0)
		Time.at(t).strftime("%S")
	end
end