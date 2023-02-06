class AccountHistory < ApplicationRecord
    belongs_to :account, dependent: :destroy
end
