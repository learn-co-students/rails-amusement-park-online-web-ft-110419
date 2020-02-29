class SessionsController < ApplicationController
    def new
        @user = User.new 
    end
    
    def create
        binding.pry
        @user = User.create(name: params[:name], password: params[:password]) 
        session[:user_id] = @user.id
    end 
end 