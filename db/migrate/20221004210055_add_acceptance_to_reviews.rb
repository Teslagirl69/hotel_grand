class AddAcceptanceToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :acceptance, :boolean, :null => false, :default => false
  end
end
