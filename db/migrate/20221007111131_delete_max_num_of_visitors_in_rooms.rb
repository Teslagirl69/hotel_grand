class DeleteMaxNumOfVisitorsInRooms < ActiveRecord::Migration[7.0]
  def change
    remove_column :rooms, :max_number_of_visitors, :integer
  end
end
