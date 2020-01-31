class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
            @message = "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif self.user.tickets < self.attraction.tickets
            @message = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif self.user.height < self.attraction.min_height
            @message =  "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        elsif self.user.tickets >= self.attraction.tickets && self.user.height >= self.attraction.min_height
            tickets = self.user.tickets - self.attraction.tickets
            nausea = self.user.nausea + self.attraction.nausea_rating
            happiness = self.user.happiness + self.attraction.happiness_rating
            self.user.update(:tickets => tickets, :nausea => nausea, :happiness => happiness)
            @message = "Thanks for riding the #{@ride.attraction.name}!"
        end
        @message
    end

    def take_ride
        if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
            return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif self.user.tickets < self.attraction.tickets
            return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif self.user.height < self.attraction.min_height
            return "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        elsif self.user.tickets >= self.attraction.tickets && self.user.height >= self.attraction.min_height
            tickets = self.user.tickets - self.attraction.tickets
            nausea = self.user.nausea + self.attraction.nausea_rating
            happiness = self.user.happiness + self.attraction.happiness_rating
            self.user.update(:tickets => tickets, :nausea => nausea, :happiness => happiness)
        end
    end
end
