class AddPostsIdToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :posts_id, :integer
    add_index :likes, :posts_id
  end
end
