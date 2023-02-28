class SessionsController < ApplicationController
    def destroy
        session.delete(:user_id) # for delete session
        flash[:message] = "You have successfully logged out."
        session[:user_id] = nil
        redirect_to root_path
    end
end