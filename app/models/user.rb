class User < ActiveRecord::Base
	def how_old
		"I\'m " + self.age.to_s + " years old"
	end
end
