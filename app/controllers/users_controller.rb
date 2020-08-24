class UsersController < ApplicationController
    before_action :set_user, only: [:index, :edit, :show, :destroy]

    def index ###not sure i want to set it up like this as of yet
        @users = User.all
    end
    
    def new 
        @user = User.new
    end

    def create ### the code is trying to still send to next page even if the params are invalid
        @user = User.new(user_params)
        if @user.save
        session[:user_id] = @user.id
            redirect_to root_path
        else 
            render :new
        end
    end
    

    def show 
        @assignment = Assignment.find_by_id(params[:id])
        @course = Course.find_by_id(params[:id])
    end

    def edit   
    end

    def update
        if current_user && @user_id == @user.id
            @user.update
            redirect_to user_path(current_user)
        else
            render :edit
        end
    end

    def destroy
     current_user
        @user.destroy
        redirect_to root_path
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :first, :last)
    end

    def set_user
        @user = User.find_by_id(params[:id])
    end
end
