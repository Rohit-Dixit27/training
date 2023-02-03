class Book < ApplicationRecord
  validates :name, presence: { strict: true }
  validates :name, length: { minimum: 3, message: "required minimum 3" }
  belongs_to :author, counter_cache: true 
  validates_associated :author  # Enter Value In author_id Column Is Mandatory 
  validates :title, format: { with: /\A[a-zA-Z]+\Z/, message: "numbers not allowed" }
  validates :title, length: { maximum: 20, message: "limit is crossed" }
  validates :title, uniqueness: { case_sensitive: true }
  validates :description, length: { in: 10..200, too_short: "%{count} max allowed" }
end





