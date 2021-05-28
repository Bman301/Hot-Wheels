class AddColumnToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :status, :string, :default => "available"
  end
end
