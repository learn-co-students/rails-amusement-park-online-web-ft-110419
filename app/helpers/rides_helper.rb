module RidesHelper
    def create_ride(attraction)
        ride = Ride.create(user: current_user, attraction: attraction )
        current_user.tickets -=1
        
        current_user.save
    end
end
