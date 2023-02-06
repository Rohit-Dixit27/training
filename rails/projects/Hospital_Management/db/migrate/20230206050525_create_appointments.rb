class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.datetime :appointment_date
      t.belongs_to :patient
      t.belongs_to :physician
      t.timestamps
    end
  end
end
