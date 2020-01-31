class UsersController < ApplicationController
  # before_action :require_login
  # # skip_before_action :require_login, only: [:new]



    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            return head(:forbidden) unless @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            # if @user.admin?
            #   redirect_to user_path(@user)
            # else
            #   redirect_to root_path
            # end
            redirect_to user_path(@user)
        else
            redirect_to new_user_path
            # redirect_to root_path
        end
      end

      def show 
        @user = User.find(params[:id])
        redirect_to root_path unless session.include? :user_id
      end
     
      def index
      end

      private
     
      def user_params
        # params.require(:user).permit(:name, :password, :password_confirmation, :nausea, :happiness, :tickets, :height, :admin)
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
      end
end