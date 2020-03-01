class User < ActiveRecord::Base
    has_secure_password
    has_many :attractions
    has_many :rides
    has_many :attractions, through: :rides

    def mood    
        if !happiness.nil?
         happiness < nausea ? "sad" :  "happy"
        end
    end     
    
end