class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    if logged_in?  
    @user = User.find(session[:user_id])
    else
      redirect_to '/'
    end
   
  end

  def signin # Shows signin form
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def logged_in?
      @user.id == session[:user_id]
    end
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets,:height)
    end
end
