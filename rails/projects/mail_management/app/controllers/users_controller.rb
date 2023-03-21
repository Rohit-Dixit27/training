class UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    #@users = User.all
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def search
    @query = params[:query]
    @users = User.where("users.email LIKE ?", ["%#{@query}%"]).or(User.where("users.name ILIKE ?", ["%#{@query}%"])).paginate(page: params[:page], per_page: 5)
    render "index"
  end

  def import_from_excel
    file = params[:file]
    file_ext = File.extname(file.original_filename)

    if User::ALLOWED_EXTENSIONS.include?(file_ext)
      spreadsheet = (file_ext == ".xls") ? Roo::Excel.new(file.path) : Roo::Excelx.new(file.path)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
      User.create(sno: spreadsheet.row(i)[0], name: spreadsheet.row(i)[1], email: spreadsheet.row(i)[2])
      end
      flash[:notice] = "imported"
    else
      flash[:notice] = "supports only excel files"
    end
    redirect_to root_path
  end
end
