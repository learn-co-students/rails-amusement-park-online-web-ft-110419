class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        if !admin?
            if self.nausea >= self.happiness
                return "sad"
            elsif self.happiness > self.nausea
                return "happy"
            end
        end
    end

    def admin?
        self.admin == true
    end

    def message
        
        if self.rides.empty?
            message = "welcome!"
        else 
            message = "#{self.rides.last.take_ride}"
        end
    end
end

# def take_ride

# end