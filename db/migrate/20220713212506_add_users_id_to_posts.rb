class AddUsersIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :users_id, :integer
    add_index :posts, :users_id
  end
end
