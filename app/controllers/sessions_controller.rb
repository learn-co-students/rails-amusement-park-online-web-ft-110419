class SessionsController < ApplicationController


    def signin
        if logged_in?
            redirect_to user_path(session[:user_id])
        else 
            render 'signin'
        end 
    end

    def create 
        @user = User.find_by(id: params[:user][:id])
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            redirect_to '/signin'
        end
    end 

    # logout 
    def destroy
        session[:user].delete :user_id
    end 

    private 
    def user_params
        params.require(:user).permit(:name, :password)
    end 
end
