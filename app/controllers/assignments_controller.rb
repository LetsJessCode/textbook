class AssignmentsController < ApplicationController
    before_action :this_assignment, only: [:show, :edit, :update, :destroy]
    

    def index
        @assignments = current_user.assignments.all
    end

    def new
        @assignment = Assignment.new
    end

    def create
        #  binding.pry
     @assignment = current_user.assignments.build(assignment_params)
        if @assignment.save
            # binding.pry
          redirect_to user_assignments_path(current_user, @assignment)
        else
          render :new
      end
  end

    def show

    end

    def edit
      binding.pry
      current_user
      if @assignment && @assignment.id == current_user
          redirect_to user_edit_assignment_path(current_user, @assignment)
      else
        render :edit
    end
  end 

    def update

    end

    def destroy

    end

  private
    def assignment_params
        params.require(:assignment).permit(:name, :comment, :due, :completed, :user_id, :course_id, course_attributes: [:name] )
    end

    def this_assignment
         current_user.assignments.find_by_id(params[:id])
    end
end
