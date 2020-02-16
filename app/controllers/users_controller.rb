class UsersController < ApplicationController
    
  def show
    
    redirect_to '/' unless logged_in?
    @user = User.find(params[:id])
  end
  def new
  @user = User.new

  end
def create
  
  @user = User.create(user_params)
  
  session[:user_id] = @user.id
  redirect_to user_path(@user)
end
  private

  def user_params
    params.require(:user).permit(
      :name,
      :height,
      :nausea,
      :tickets,
      :admin,
      :password,
      :happiness
    )
  end
end
