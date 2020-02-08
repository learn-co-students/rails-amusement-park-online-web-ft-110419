class Attraction < ApplicationRecord
    has_many :rides
    has_many :users, through: :rides

    


    def check_height
        user.height < attraction.min_height
    end 

    def check_tickets
        user.tickets < attraction.tickets
    end 

    def check_height_and_tickets
        if check_height && check_tickets
            "You are not tall enough to ride the #{attraction.name}. You do not have enough tickets to ride the #{attraction.name}."
        elsif check_height
            "You are not tall enough to ride the #{attraction.name}."
        elsif check_tickets
           "You do not have enough tickets to ride the #{attraction.name}."
        end 
    end 

end
