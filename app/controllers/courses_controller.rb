class CoursesController < ApplicationController

    def index #working
        @courses = Course.all
    end

    def show #working
        @course = Course.find_by_id(params[:id])
        @assignments = Assignment.find_by_id(params[:id])
    end
end
