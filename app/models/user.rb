class User < ActiveRecord::Base
    has_secure_password
    has_many :attractions
    has_many :rides
    has_many :attractions, through: :rides
    # validate :tall_enough?, :enough_tickets?, on: :update

    # def tall_enough?
        
    #     if self.height < 80
    #         errors.add(:height, "You are not tall enough to ride the")
    #     end
    # end

    def enough_tickets?
        if self.tickets < 200
            errors.add(:tickets, "You do not have enough tickets to to ride the")
        end
    end
end