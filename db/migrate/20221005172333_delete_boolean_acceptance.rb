class DeleteBooleanAcceptance < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :acceptance, :boolean
  end
end
