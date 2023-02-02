class Book < ApplicationRecord
    validates :name, presence: true
    belongs_to :author , counter_cache: true
    
end





