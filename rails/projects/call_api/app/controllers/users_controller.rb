class UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    response = HTTParty.get("https://api.publicapis.org/categories")
    @response = JSON.parse(response.body)
    @categories = @response["categories"]
  end
end
