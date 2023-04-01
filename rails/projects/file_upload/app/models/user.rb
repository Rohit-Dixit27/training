class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true
  ALLOWED_EXTENSIONS = ['.xls', '.xlsx']
end
