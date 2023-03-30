class UsersController < ApplicationController
  def index
   # @users = User.all.page(params[:page])
    @users = User.paginate(page: params[:page], per_page: 3)
    respond_to do |format|
      format.js 
      format.html
    end
  end
end
