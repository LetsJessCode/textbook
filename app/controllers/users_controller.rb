class UsersController < ApplicationController
    before_action :set_user, only: [:index, :edit, :show, :destroy]

    def index 
        @users = User.all
    end
    
    def new 
        @user = User.new
    end

    def create ### working!!!
        @user = User.new(user_params)
        if @user.save
        session[:user_id] = @user.id
            redirect_to root_path
            flash[:notice] = "Successfully Logged In!"
        else 
            render :new
            flash[:notice] = "Email Already Taken. Password Cannot Blank"
        end
    end
    

    def show 
        @assignment = Assignment.find_by_id(params[:id])
        @course = Course.find_by_id(params[:id])
        @user = User.find_by_id(params[:id])
    end

    def edit  
        @user = User.find_by_id(params[:id])
    end

    def update
        if current_user.update(user_params)
            redirect_to user_path(current_user)
        else
            render :edit
        end
    end

    def destroy
        User.find_by_id(session[:user_id]).destroy      
        session[:user_id] = nil     
     redirect_to root_path
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :first, :last, :avatar, :admin)
    end

    def set_user
        @user = User.find_by_id(params[:id])
    end
end
