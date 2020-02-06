class UsersController < ApplicationController
  before_action :verify_user, only: [:show]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to root_path
  end
  
  private
  
  def user_params
    return params.require(:user).permit(
      :name,
      :password,
      :nausea,
      :happiness,
      :tickets,
      :height,
      :admin
    )
  end
  
end
