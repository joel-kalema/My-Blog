class AddUsersIdToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :users_id, :integer
    add_index :likes, :users_id
  end
end
