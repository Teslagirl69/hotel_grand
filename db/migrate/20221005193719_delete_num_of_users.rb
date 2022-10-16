class DeleteNumOfUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :num_of_persons, :integer
  end
end
