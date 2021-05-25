class RemoveCommentFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :comment, :text
  end
end
