class AddPostsIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :posts_id, :integer
    add_index :comments, :posts_id
  end
end
