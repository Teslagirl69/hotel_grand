class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :last_date
      t.integer :num_of_persons
      t.integer :room_id

      t.timestamps
    end
  end
end
