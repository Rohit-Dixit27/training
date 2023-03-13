class UsersController < ApplicationController
    def index
    end
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            NotifierMailer.with(user: @user).send_notification.deliver_later
            redirect_to root_path
        else
            render :new
        end
    end
    def user_params
        params.require(:user).permit(:name, :email)
    end
end
