class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood
            # User has a method 'mood' that returns 'sad' when the user is more nauseous than happy
            # User has a method 'mood' that returns 'happy' when the user is more happy than nauseous
    end
end
