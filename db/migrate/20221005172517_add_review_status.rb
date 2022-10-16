class AddReviewStatus < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :status, :integer, default: 0
  end
end
