class UsersController < ApplicationController
    skip_after_action :verify_same_origin_request

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
    respond_to do |format|
      format.js 
      format.html
    end
  end

  def search
    @query = params[:query]
    @users = User.where("users.name LIKE?", ["%#{@query}%"]).paginate(page: params[:page], per_page: 3)
    respond_to do |format|
      format.js { render "index" } 
      format.html
    end
  end
end
