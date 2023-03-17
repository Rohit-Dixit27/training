class UsersController < ApplicationController
  def index
  end
  def preview
    @user = User.find(params[:id])
  end
  def search
  end
end
