class MainController < ApplicationController
    def index
        flash[:notice] = "logged in successfully"
        if session[:user_id]
            @user = User.find_by(id: session[:user_id])
        end
    end
end