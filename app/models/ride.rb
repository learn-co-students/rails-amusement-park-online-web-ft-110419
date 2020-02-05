class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        return check_height_and_tickets if !check_height_and_tickets.nil?
        
        tickets = user.tickets - attraction.tickets
        happiness = user.happiness + attraction.happiness_rating 
        nausea = user.nausea + attraction.nausea_rating
        
        user.update(tickets: tickets, happiness: happiness, nausea: nausea)
    end

    def check_height?
        user.height < attraction.min_height
    end

    def check_tickets?
        user.tickets < attraction.tickets
    end
    
    def check_height_and_tickets
        if check_height? && check_tickets?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif check_height?
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif check_tickets?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        end
    end
end
