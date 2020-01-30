class UsersController < ApplicationController

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            return head(:forbidden) unless @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            byebug
            redirect_to users_show_path(@user)
            # redirect_to users_path
        else
            redirect_to users_new_path
        end
      end

    #   def show 
    #     @user = User.find(params[:id])
    #   end
     
      private
     
      def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :nausea, :happiness, :tickets, :height, :admin)
      end
end