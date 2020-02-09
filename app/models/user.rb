class User < ApplicationRecord
	has_secure_password
	has_many :rides 
	has_many :attractions, through: :rides
	validates :name, presence: true
	def mood
		mood = 'happy'
		if self.nausea > self.happiness 
			mood = 'sad'
		end
		mood
	end
	def add_tickets=(value)
		self.tickets += value.to_i 
	end
	def add_tickets
		self.tickets
	end

end
