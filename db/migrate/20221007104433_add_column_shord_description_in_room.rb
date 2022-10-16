class AddColumnShordDescriptionInRoom < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :short_description, :text
  end
end
