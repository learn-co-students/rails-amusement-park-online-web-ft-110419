class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        # Ride has a method 'take_ride' that accounts for the user not having enough tickets
        # Ride has a method 'take_ride' that accounts for the user not being tall enough
        # Ride has a method 'take_ride' that accounts for the user not being tall enough and not having enough tickets
        # Ride has a method 'take_ride' that updates ticket number
        # Ride has a method 'take_ride' that updates the user's nausea
        # Ride has a method 'take_ride' that updates the user's happiness
    end
end
