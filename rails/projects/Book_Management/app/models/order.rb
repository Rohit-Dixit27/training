
class Check_Card_Number < ActiveModel::Validator
  def validate(record)
    unless record.card_number.match?(/\A[0-9]+\Z/)
      record.errors.add :card_number, "should contain numbers only"
    end
   end
end

class Order < ApplicationRecord
  validates :payment_type, presence: true
  validates :card_number, presence: true, if: :paid_with_card?

  def paid_with_card?
    payment_type == "card"
  end
  validates :amount, format: { with: /\A[0-9]+\Z/ },
  unless: Proc.new { |amount_to_pay| amount_to_pay.amount.blank? }
  include ActiveModel::Validations
  validates_with Check_Card_Number
  

end
