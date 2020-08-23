class AssignmentsController < ApplicationController
    before_action :this_assignment, except: [:index, :new, :create]

    def index
        @assignments = Assignment.all
        @user = User.find_by_id(params[:id])
        @subject = Subject.find_by_id(params[:id])
    end

    def new

    end

    def create

    end

    def show

    end

    def edit
       @user = User.find_by_id(params[:id])
       @course = Course.find_by_id(params[:id])
    end

    def update

    end

    def destroy

    end

  private
    def assignment_params
        params.require(:assignment).permit(:name, :comment, :due, :completed, :user_id, :course_id)
    end

    def this_assignment
         Assignment.find_by_id(params[:id])
    end
end
