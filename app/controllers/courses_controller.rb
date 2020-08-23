class CoursesController < ApplicationController

    def index
        @courses = Course.all
    end

    def show
        @course = Course.find_by_id(params[:id])
        @assignments = Assignment.find_by_id(params[:id])
    end
end
