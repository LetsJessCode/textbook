class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        user = User.find_by(email: params["user"]["email"]).try(:authenticate, params["user"]["password"])
    end


    def destroy
        session.clear
        redirect_to root_path
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
