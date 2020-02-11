class SessionsController < ApplicationController
    def new
    end
    def create # Sign In - creates new user
        user = User.create(user_params)
        session[:user_id] = user.id
        redirect_to user_path user
    end
    def login
        @user = User.find_by(id: params[:user_name]).try(:authenticate, params[:password])

        if @user
            session[:user_id] = @user.id
            redirect_to @user
        else 
            redirect_to '/signin'
        end
    end
    def destroy
       session.delete :user_id
       redirect_to '/'
    end
    private 
    
    def user_params
        params[:user].permit(:name,:height,:happiness,:nausea,:tickets,:password,:admin)
    end
end
