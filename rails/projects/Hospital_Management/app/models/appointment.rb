class Appointment < ApplicationRecord
    belongs_to :patient, dependent: :destroy
    belongs_to :physician, dependent: :destroy
end
