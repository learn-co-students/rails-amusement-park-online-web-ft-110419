class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if self.enough_tickets && self.tall_enough
            self.user.update_tickets(self.attraction)
            self.user.update_nausea(self.attraction)
            self.user.update_happiness(self.attraction)
            "Thanks for riding the #{self.attraction.name}!"
        else
            if !self.enough_tickets && !self.tall_enough
                "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
            elsif !self.enough_tickets
                "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
            elsif !self.tall_enough 
                "Sorry. You are not tall enough to ride the #{self.attraction.name}."
            end
        end
    end

    def enough_tickets
        self.user.tickets >= self.attraction.tickets
    end

    def tall_enough
        self.user.height >= self.attraction.min_height
    end

end
