class AssignmentsController < ApplicationController
    before_action :this_assignment, only: [:show, :edit, :update, :destroy]
    

    def index 
      if params[:term]
        @assignments = Assignment.search(params[:term])
      else
      @assignments = Assignment.sorted_incomplete
     end 
    end

    def new
        @assignment = Assignment.new
    end

    def create #working!
        #  binding.pry
     @assignment = current_user.assignments.build(assignment_params)
        if @assignment.save
            # binding.pry
          redirect_to user_assignments_path(current_user, @assignment)
        else
          render :new
      end
  end

    def show #this is good!
    
    end

    def edit ###not working....current_user is showing nil
      current_user
      if @assignment && @assignment.id == current_user
          redirect_to user_edit_assignment_path(current_user, @assignment)
          flash[:message] = "Successfully Updated Assignment"
      else
        render :edit
    end
  end 

    def update
      current_user
      if @assignment.update(assignment_params)
        redirect_to user_assignments_path(current_user, @assignment)
      else
        render :edit
      end
    end


  private
    def assignment_params
        params.require(:assignment).permit(:name, :comment, :due, :completed, :user_id, :course_id, course_attributes: [:name] )
    end

    def this_assignment
       @assignment = Assignment.find_by_id(params[:id])
    end
end
