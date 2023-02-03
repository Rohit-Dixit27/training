class Author < ApplicationRecord
  validates :name, presence: true
  validates :gender, presence: true
  validates :name, exclusion: { in: %w(admin root), message: "not allowed" } 
  validates :gender, inclusion: { in: %w(male female), message: "choose either male or female" }
  validates :salary, numericality: { only_integer: true }
  validates :contact, uniqueness: true, allow_blank: true
  has_many :books
    #validates_each :name do |record, attr, value|
       # record.errors.add(attr, 'should start with lowercase')
      #  if value =~ /\A[[:upper:]]/
     #   end
    #end
end
