class UsersController < ApplicationController
    before_action :set_user, only: [:index]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
        session[:user_id] = @user.id
            redirect_to users_path(@user)
        else 
            render :new
        end
    end


    def index
        @users = User.all
    end

    def show 
        @assignment = Assignment.find_by_id(params[:id])
        @course = Course.find_by_id(params[:id])
    end

    def edit
        
    end

    def update
        @assignment = Assignment.find_by_id(params[:id])
        if @user && @user_id == @assignment.user_id
            redirect_to edit_user_assignment_path(user)
        else
            render :index
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :first, :last)
    end

    def set_user
        @user = User.find_by_id(params[:id])
    end
end
