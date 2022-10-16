class RenameAuthorToAuthorNameInReviews < ActiveRecord::Migration[7.0]
  def change
    rename_column :reviews, :author, :author_name
  end
end
