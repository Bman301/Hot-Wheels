class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :brand
      t.integer :year
      t.string :location
      t.string :title
      t.string :price
      t.text :description
      t.string :photo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
