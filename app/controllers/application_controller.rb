class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    private
    def current_user
        User.find_by_id(session[:user_id]) if logged_in?
    end

    def logged_in?
        !!session[:user_id]
    end
end
