class ApplicationController < ActionController::Base

    add_flash_types :info, :error, :warning
    
    helper_method :current_user, :logged_in?

    private
    def current_user
        User.find_by_id(session[:user_id])  
    end

    def logged_in?
        !current_user.nil?  
    end
end
