class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        # binding.pry
        @user = User.find_by_email(user_params[:email])

        if @user && @user.authenticate(user_params[:password])
            session[:user_id] = @user.id
             redirect_to users_path(@user)
        else
            render :new
        end 
    end


    def destroy #need to check why it doesn't route to root properly.
        session.clear
        redirect_to root_path
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :first, :last)
    end
end
