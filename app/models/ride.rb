class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction
    
    def take_ride 
        return check_height_and_tickets if !check_height_and_tickets.nil?

        tkt = self.user.tickets - self.attraction.tickets
        happy = self.user.happiness + self.attraction.happiness_rating
        sick = self.user.nausea + self.attraction.nausea_rating
        # binding.pry

        self.user.update(tickets: tkt, happiness: happy, nausea: sick)

        "Thanks for riding the #{self.attraction.name}!" 
        
    end 
    

    def check_height
        self.user.height < self.attraction.min_height
    end 

    def check_tickets
        self.user.tickets < self.attraction.tickets
    end 

    def check_height_and_tickets
        if check_height && check_tickets
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif check_height
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        elsif check_tickets
           "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        end 
    end 

end
