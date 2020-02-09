class SessionsController < ApplicationController

    def signin
        if logged_in?
            redirect_to user_path(session[:user_id])
        else 
            render 'signin'
        end 
    end

    def create 
        @user = User.find_by(id: params[:user_name])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            redirect_to '/signin'
        end
    end 

    # logout 
    def destroy
        session.delete :user_id
        redirect_to '/'
    end 

    private 
    def user_params
        params.require(:user).permit(:name, :password)
    end 
end