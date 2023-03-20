class UsersController < ApplicationController
  def index
    @users = User.all
    respond_to do |format|
      format.html { render :index, status: :ok }
    end
  end

  def preview
    @user = User.find(params[:id])
  end

  def search
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end
end
