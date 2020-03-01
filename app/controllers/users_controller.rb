class UsersController < ApplicationController

    def index
        @users = User.all
    end 

    def new 
        @user = User.new
    end 

    def create
        @user = User.create(pair_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end 

    def show 
        if !session[:user_id].nil?
            @user = User.find_by_id(params[:id])
        else 
            redirect_to root_path
        end 
    end
    

    def destroy     
        session.delete :user_id
        redirect_to root_path
    end         


    private 

    def pair_params 
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end 
end
