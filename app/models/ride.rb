class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
            return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif self.user.tickets < self.attraction.tickets
            return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif self.user.height < self.attraction.min_height
            return "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        elsif self.user.tickets >= self.attraction.tickets && self.user.height >= self.attraction.min_height
            tickets = self.user.tickets
            nausea = self.user.nausea
            happiness = self.user.happiness
            self.user.update(:tickets => (tickets - 5), :nausea => (nausea + 2), :happiness => (happiness + 4))
        end
    end
end
