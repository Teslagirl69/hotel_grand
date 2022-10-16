class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :max_number_of_visitors

      t.timestamps
    end
  end
end
