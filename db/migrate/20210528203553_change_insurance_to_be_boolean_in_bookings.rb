class ChangeInsuranceToBeBooleanInBookings < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :insurance,  'boolean USING CAST(insurance AS boolean)'
  end
end
