class Author < ApplicationRecord
  validates :name, presence: true
  validates :gender, presence: true
  validates :name, exclusion: { in: %w(admin root), message: "not allowed" } 
  validates :gender, inclusion: { in: %w(male female), message: "choose either male or female" }
  validates :salary, numericality: { only_integer: true }
  validates :contact, uniqueness: true, allow_blank: true
  validates :join_date, comparison: { less_than: :resign_date }
  has_many :books dependent: :destroy
  validate :check_first_name_letter, on: :create
  def check_first_name_letter
    errors.add(:name, "should have letters only") unless name.match?(/\A[A-Za-z]+\Z/)
  end
    #validates_each :name do |record, attr, value|
       # record.errors.add(attr, 'should start with lowercase')
      #  if value =~ /\A[[:upper:]]/
     #   end
    #end
end