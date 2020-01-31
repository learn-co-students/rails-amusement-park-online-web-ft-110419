class SessionsController < ApplicationController

    def new
        @user = User.new
    end
    
    def create
        @user = User.find_by(name: params[:user][:name])
        # return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        # if @user.admin?
        #   redirect_to user_path(@user)
        # else
        #   redirect_to root_path
        # end
        redirect_to user_path(@user)
      end

        def destroy

          # @user = @user(session[:user_id])
          # if @user.admin?
            session.delete :user_id
            redirect_to root_path
          # end

          # else

          # end
        end
    

      private

      def user_params
        params.require(:user).permit(:name, :password)
      end

end