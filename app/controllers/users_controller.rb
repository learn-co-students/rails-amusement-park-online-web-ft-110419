class UsersController < ApplicationController

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            return head(:forbidden) unless @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to new_user_path
        end
      end

      def show 
        @user = User.find(params[:id])
      end
     
      def index
      end

      private
     
      def user_params
        # params.require(:user).permit(:name, :password, :password_confirmation, :nausea, :happiness, :tickets, :height, :admin)
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)

      end
end