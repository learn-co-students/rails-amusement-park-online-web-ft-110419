module AttractionsHelper
	def if_admin(user: user, attraction: attraction)
		if user.admin == true
			link_to("Edit Attraction", edit_attraction_path(attraction))
		else 
			@ride = Ride.new
			render :partial => 'rides/new_ride_form', :locals => { user: @user, attraction: @attraction}
		end
	end
	def if_admin_index(user)
		if user.admin 
			link_to("New Attraction", new_attraction_path)
		end
	end
end
