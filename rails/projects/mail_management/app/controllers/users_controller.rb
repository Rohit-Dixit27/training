class UsersController < ApplicationController
    def index
        @users = User.all
    end
    def import_from_excel
        file = params[:file]
        begin
          # Retreive the extension of the file
          file_ext = File.extname(file.original_filename)
          raise "Unknown file type: #{file.original_filename}" unless [".xls", ".xlsx"].include?(file_ext)
          spreadsheet = (file_ext == ".xls") ? Roo::Excel.new(file.path) : Roo::Excelx.new(file.path)
          header = spreadsheet.row(1)
          (2..spreadsheet.last_row).each do |i|
            User.create(sno: spreadsheet.row(i)[0], name: spreadsheet.row(i)[1], email: spreadsheet.row(i)[2])
          end
          flash[:notice] = "Records Imported"
          redirect_to users_path 
        rescue Exception => e
          flash[:notice] = "supports only excel files"
          redirect_to users_path 
        end
      end
end
