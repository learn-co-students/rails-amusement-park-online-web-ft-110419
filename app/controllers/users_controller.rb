class UsersController < ApplicationController
    
    def show
        redirect_to '/' unless logged_in?
        @user = current_user
    end

    def signin # Shows signin form
    end

    
end