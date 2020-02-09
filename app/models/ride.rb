class Ride < ActiveRecord::Base
	belongs_to :user
	belongs_to :attraction

	def take_ride
		message = ""
		can_ride = true
		if self.user.tickets < self.attraction.tickets
			message = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
			can_ride = false
			if self.user.height < self.attraction.min_height
				message += " You are not tall enough to ride the #{self.attraction.name}."
			end
		elsif self.user.height < self.attraction.min_height
			message += "Sorry. You are not tall enough to ride the #{self.attraction.name}."
			can_ride = false
		end 
		if can_ride == true
			self.user.tickets -= self.attraction.tickets
			self.user.nausea += self.attraction.nausea_rating
			self.user.happiness += self.attraction.happiness_rating
			self.user.save
		end 
		message
	end
end

