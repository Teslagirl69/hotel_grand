class DeleteRoomIdInReviews < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :room_id, :bigint
  end
end
