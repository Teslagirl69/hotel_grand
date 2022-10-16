class DeleteIndexInReviews < ActiveRecord::Migration[7.0]
  def change
    remove_index "reviews", column: [:room_id], name: "index_reviews_on_room_id"
  end
end
