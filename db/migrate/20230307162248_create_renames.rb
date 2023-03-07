class CreateRenames < ActiveRecord::Migration[7.0]
  def change
    rename_column :likes, :user_id, :AuthorId
    rename_column :posts, :user_id, :AuthorId
    rename_column :comments, :user_id, :AuthorId
  end
end
