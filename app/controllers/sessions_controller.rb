class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        # binding.pry
        @user = User.find_by_email(user_params[:email])

        if @user && @user.authenticate(user_params[:password])
            session[:user_id] = @user.id
             redirect_to user_assignments_path(@user)
             flash[:notice] = "Successfully Logged In!"
        else
            flash[:message] = "Incorrect Email or Password"         
             redirect_to login_path    
        end 
    end

    def omniauth  
      user = User.create_from_omniauth(auth)       
       if user.valid?           
         session[:user_id] = user.id          
           redirect_to user_assignments_path(current_user)    
           flash[:notice] = "Successfully Logged In!"
      else           
          flash[:message] = "Incorrect Login Information"          
             redirect_to sessions_login_path        
        end 
     end 

    def destroy #need to check why it doesn't route to root properly.
        session.clear
        flash[:message] = "Have a great day!"
        redirect_to root_path
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :first, :last)
    end

    def auth   
      request.env['omniauth.auth'] 
    end
end
