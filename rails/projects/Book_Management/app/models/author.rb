class Author < ApplicationRecord
    validates :name, presence: true
    has_many :books
    self.primary_key = 'a_id'   
end
