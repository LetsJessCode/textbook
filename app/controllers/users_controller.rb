class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @user = User.find_by_id(params[:id])
        @assignment = Assignment.find_by_id(params[:id])
        @course = Course.find_by_id(params[:id])
    end
end
