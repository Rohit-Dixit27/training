class UsersController < ApplicationController
    skip_after_action :verify_same_origin_request
    helper_method :sort_column, :sort_direction

  def index
    @users = User.order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 3)
    respond_to do |format|
      format.js 
      format.html
    end
  end

  def search
    @query = params[:query]
    @users = User.where("users.name ILIKE?", ["%#{@query}%"]).paginate(page: params[:page], per_page: 3)
    respond_to do |format|
      format.js { render "index" } 
      format.html
    end
  end

  private
  def sort_column
    params[:sort] || "name"
  end

  def sort_direction
    params[:direction] || "asc"
  end
end
