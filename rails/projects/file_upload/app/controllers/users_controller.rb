
class UsersController < ApplicationController
  def index
    @users = User.all
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
    redirect_back(fallback_location: root_path)
  end

end
