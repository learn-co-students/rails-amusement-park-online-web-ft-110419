class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides 
    # validates :password, presence: true 

    def mood
        if happiness && nausea
            happiness > nausea ? "happy" : "sad"
        end
    end

    def is_admin?
        self.admin == true 
    end 
    
end
