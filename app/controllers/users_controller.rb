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
            redirect_to user_assignments_path(current_user)
            flash[:notice] = "Successfully Logged In!"
        else 
            render :new
            flash[:message] = "Email or Password already taken"
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
        if current_user && @user_id == @user.id
            @user.update
            redirect_to user_path(current_user)
        else
            render :edit
        end
    end

    def destroy
     user = User.find_by_id(params[:id]) 
        user.destroy
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
